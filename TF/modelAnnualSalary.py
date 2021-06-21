# SELECT empCurrentSalaryAmount [Amount]
# , (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) [Interval]
# , empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) [Salary]
# FROM vwClientsEmployment 
# WHERE empCurrentSalaryAmount IS NOT NULL
# AND empCurrentSalaryInterval IN (14,60)
# AND CAST( empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) AS INT) < 150000


inputData = pd.read_csv('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\temp.csv')
validationData = pd.read_csv('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\temp.csv')
inputExpected = inputData.pop('Salary')
validationExpected = validationData.pop('Salary')

model = None

if input("Load model? y/n") != 'n':
    fname = '\\\\insrvr2\\folders$\\Kieran\\Desktop\\TF\\' + input("file name")
    model = keras.models.load_model(fname)

else:
    model = keras.Sequential([
        keras.layers.Flatten(input_shape=(2,)),
        keras.layers.Dense(32 , activation='relu'),
        keras.layers.Dense(32 , activation='relu'),
        keras.layers.Dense(16 , activation='relu'),
        keras.layers.Dense(8),
        keras.layers.Dense(1)
    ])


    callbacks = [
        tf.keras.callbacks.EarlyStopping(monitor='val_loss', patience=10, verbose=0),
    ]

    model.compile(optimizer='adam', 
                loss='mean_squared_logarithmic_error',
                metrics=['mae','accuracy'])

if input("train? y/n") != 'n':
    model.fit(inputData, inputExpected, batch_size=50, epochs=1000, validation_data=(validationData,validationExpected), callbacks=callbacks, shuffle=True)

prediction = model.predict(validationData)

#this outputs the actual function if the input is 1D
# for _ in range(100):
#     i = int(random.randrange(0,1000))
#     print(validationData[i], ',', prediction[i][0])

print('\n\n\n')

for _ in range(1000):
    i = int(random.randrange(0,len(validationExpected)-1))
    print(validationExpected[i], ',', prediction[i][0])

if input("Save model? y/n") == 'y':
    fname = '\\\\insrvr2\\folders$\\Kieran\\Desktop\\TF\\' + input("file name")
    if not os.path.exists(fname):
        os.mkdir(fname)
    model.save(fname )

