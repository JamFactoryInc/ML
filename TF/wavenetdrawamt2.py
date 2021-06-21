# SELECT DATEDIFF(day, PaymentDate, GETDATE()) - MIN(DATEDIFF(day, PaymentDate, GETDATE())) OVER() [Time]
# 	,  SUM(Amount) [Amount]
# FROM vwAccountsPayments
# WHERE PaymentType = 4
# GROUP BY PaymentDate
# ORDER BY DATEDIFF(day, PaymentDate, GETDATE())


#  SELECT DATEDIFF(day, CreateDate, GETDATE()) - MIN(DATEDIFF(day, CreateDate, GETDATE())) OVER()
#  	,  COUNT(ContractID)
#  FROM vwAccounts
#  GROUP BY DATEDIFF(day, CreateDate, GETDATE())
#  ORDER BY DATEDIFF(day, CreateDate, GETDATE())

from os.path import split


CSV_NAME = 'temp'
TIMESTEP_COLUMN = 'Time'
DATA_COLUMN = 'Amount'

EPOCHS = 100
LOSS_METRIC_EPOCHS = 100
BATCH_SIZE = 128
PATIENCE = 50
TRAINING_DATA_PERCENT = 0.75
FORECAST_TIMESTEPS = 90

LAYERS = 6
WINDOW_SIZE = 30
LEARNING_RATE = 1.5e-3



def plot_series(time, series, format="-", start=0, end=None, label=None):
    plt.plot(time[start:end], series[start:end], format, label=label)
    plt.xlabel(TIMESTEP_COLUMN)
    plt.ylabel(DATA_COLUMN)
    if label:
        plt.legend(fontsize=14)
    plt.grid(True)


def seq2seq_window_dataset(series, window_size, batch_size=32,
                           shuffle_buffer=1000):
    series = tf.expand_dims(series, axis=-1)
    ds = tf.data.Dataset.from_tensor_slices(series)
    ds = ds.window(window_size + 1, shift=1, drop_remainder=True)
    ds = ds.flat_map(lambda w: w.batch(window_size + 1))
    ds = ds.shuffle(shuffle_buffer)
    ds = ds.map(lambda w: (w[:-1], w[1:]))
	
    return ds.batch(batch_size).prefetch(1)
  

def model_forecast(model, series, window_size):
	ds = tf.data.Dataset.from_tensor_slices(series)
	ds = ds.window(window_size, shift=1, drop_remainder=True)
	ds = ds.flat_map(lambda w: w.batch(window_size))
	ds = ds.batch(32).prefetch(1)
	forecast = model.predict(ds)
	return forecast

def printProgressBar (iteration, total, prefix = '', suffix = '', decimals = 1, length = 100, fill = '\u2588', printEnd = "\r"):
    """
    Call in a loop to create terminal progress bar
    @params:
        iteration   - Required  : current iteration (Int)
        total       - Required  : total iterations (Int)
        prefix      - Optional  : prefix string (Str)
        suffix      - Optional  : suffix string (Str)
        decimals    - Optional  : positive number of decimals in percent complete (Int)
        length      - Optional  : character length of bar (Int)
        fill        - Optional  : bar fill character (Str)
        printEnd    - Optional  : end character (e.g. "\r", "\r\n") (Str)
    """
    percent = ("{0:." + str(decimals) + "f}").format(100 * (iteration / float(total)))
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    print(f'\r{prefix} |{bar}| {percent}% {suffix}', end = printEnd)
    # Print New Line on Complete
    if iteration == total: 
        print()


class CustomCallback(keras.callbacks.Callback):
    def on_epoch_end(self, epoch, logs=None):
        printProgressBar(epoch+1, EPOCHS, prefix = 'Training...', suffix = 'Loss: ' + str(logs.get('loss')), length = 50)


csv = pd.read_csv('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\'+CSV_NAME+'.csv')

inputData = csv.pop(DATA_COLUMN)
timeData = csv.pop(TIMESTEP_COLUMN)


SPLIT_TIME = int(len(inputData)*TRAINING_DATA_PERCENT)

if WINDOW_SIZE >= SPLIT_TIME:
	WINDOW_SIZE = SPLIT_TIME - 1

model = None



time_train = timeData[:SPLIT_TIME]
x_train = inputData[:SPLIT_TIME]
time_valid = timeData[SPLIT_TIME:]
x_valid = inputData[SPLIT_TIME:]

if input("Get loss metrics? y/n") == 'y':

	keras.backend.clear_session()
	tf.random.set_seed(42)
	np.random.seed(42)
	
	train_set = seq2seq_window_dataset(x_train, WINDOW_SIZE,
									batch_size=BATCH_SIZE)

	model = keras.models.Sequential()
	
	model.add(keras.layers.InputLayer(input_shape=[None, 1]))
	for dilation_rate in range(LAYERS):
		model.add(
		keras.layers.Conv1D(filters=32,
							kernel_size=2,
							strides=1,
							dilation_rate=2**dilation_rate,
							padding="causal",
							activation="relu")
		)
	model.add(keras.layers.Conv1D(filters=1, kernel_size=1))
	lr_schedule = keras.callbacks.LearningRateScheduler(
		lambda epoch: 1e-4 * 10**(epoch / 30))
	
	optimizer = keras.optimizers.Adam(lr=1e-4)
	model.compile(loss=keras.losses.Huber(),
				optimizer=optimizer,
				metrics=["mae"])
	history = model.fit(train_set, epochs=LOSS_METRIC_EPOCHS, callbacks=[customCallback])

	plt.semilogx(history.history["lr"], history.history["loss"])

	plt.show()

if input("Load? y/n") == 'y':
	files = next(os.walk('\\\\insrvr2\\folders$\\Kieran\\Desktop\\TF'))[1]
	for i, s in enumerate(files):
		print(str(i)+ '. ' + s)
	filetoaccess =  files[int(input("Save number:\n"))]
	fname = '\\\\insrvr2\\folders$\\Kieran\\Desktop\\TF\\' + filetoaccess
	model = keras.models.load_model(fname)


if input("Train? y/n") == 'y':
	keras.backend.clear_session()
	tf.random.set_seed(42)
	np.random.seed(42)


	train_set = seq2seq_window_dataset(x_train, WINDOW_SIZE,
									batch_size=BATCH_SIZE)
	valid_set = seq2seq_window_dataset(x_valid, WINDOW_SIZE,
									batch_size=BATCH_SIZE)

	model = keras.models.Sequential()
	model.add(keras.layers.InputLayer(input_shape=[None, 1]))
	for dilation_rate in range(2, LAYERS):
		model.add(
		keras.layers.Conv1D(filters=32,
							kernel_size=2,
							strides=1,
							dilation_rate=2**dilation_rate,
							padding="causal",
							activation="relu")
		)
		
	# model.add(keras.layers.Dense(16 , activation='relu'))#--------------------------------------------------
	model.add(keras.layers.Conv1D(filters=1, kernel_size=1))
	optimizer = keras.optimizers.Adam(lr=LEARNING_RATE)
	model.compile(loss=keras.losses.Huber(),
				optimizer=optimizer,
				metrics=["mae"])

	# model_checkpoint = keras.callbacks.ModelCheckpoint(
	# 	"\\\\insrvr2\\folders$\\Kieran\\Desktop\\TF\\Checkpoints\\wavenetdrawamt.h5", save_best_only=True, save_weights_only=True)
	early_stopping = keras.callbacks.EarlyStopping(patience=PATIENCE)
	customCallback = CustomCallback()
	history = model.fit(train_set, epochs=EPOCHS,
						validation_data=valid_set,
						callbacks=[customCallback],
						verbose=0)
print()
if input("Forecast? y/n") == 'y':
	inputData = inputData
	inputData = np.array(inputData)
	timeData = timeData
	timeData = np.array(timeData)
	result = []
	for i in range(0,FORECAST_TIMESTEPS):
		cnn_forecast = model_forecast(model, inputData[i:WINDOW_SIZE + i][..., np.newaxis], WINDOW_SIZE)
		
		temp = []
		for d1 in cnn_forecast:
			temp.append(d1[len(d1)-1][0])
		inputData = np.append(inputData,[temp[len(temp)-1]])
		
		timeData = np.append(timeData, timeData[len(timeData)-1]+1)
		result.append(temp[len(temp)-1])
		printProgressBar(i + 1, FORECAST_TIMESTEPS, prefix = 'Progress:', suffix = 'Complete', length = 50)
		
	plt.figure(figsize=(10, 6))
	plot_series(time_train, x_train)
	plot_series(time_valid, x_valid)
	plot_series(timeData[WINDOW_SIZE:WINDOW_SIZE + FORECAST_TIMESTEPS], result)
	print("Waiting for figure to close...")
	plt.show()

if input("Save model? y/n") == 'y':
	fname = '\\\\insrvr2\\folders$\\Kieran\\Desktop\\TF\\' + input("file name")
	if not os.path.exists(fname):
		os.mkdir(fname)
	model.save(fname)


