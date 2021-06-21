# SELECT AVG(ap.Amount) [Avg Draw]
# , (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) [Interval]
# , empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END) [Salary]
# , CASE empBasis WHEN 'C'THEN 1 WHEN 'F' THEN 2 WHEN 'P' THEN 3 WHEN 'S' THEN 4 WHEN 'W' THEN 5 END [Basis]
# , CASE Gender WHEN 'Male' THEN 0 ELSE 1 END [Gender]
# FROM vwClients cl
# INNER JOIN vwAccounts acc on acc.ClientID1 = cl.ClientID
# INNER JOIN vwClientsEmployment ce on ce.SourceID = cl.ClientID
# LEFT JOIN vwAccountsPayments ap ON acc.ContractID = ap.ContractID
# WHERE empCurrentSalaryAmount IS NOT NULL
# AND empCurrentSalaryInterval IN (14,60)
# AND ap.PaymentType = 4
# AND ap.PaymentDate > '01/Jan/2021'
# GROUP BY cl.ClientID
# 	, (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END)
# 	, empCurrentSalaryAmount * (CASE empCurrentSalaryInterval WHEN 14 THEN 26 WHEN 28 THEN 13 WHEN 60 THEN 12 ELSE 52 END)
# 	, CASE empBasis WHEN 'C'THEN 1 WHEN 'F' THEN 2 WHEN 'P' THEN 3 WHEN 'S' THEN 4 WHEN 'W' THEN 5 END
# 	, CASE Gender WHEN 'Male' THEN 0 ELSE 1 END


#best model: avgdraw3

TEST_TRAIN_FRAC = 0.9
EPOCHS = 1000
BATCH_SIZE = 100
PATIENCE = 20



csv = pd.read_csv('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\temp.csv')

inputData = csv.sample(frac=TEST_TRAIN_FRAC, random_state=0)
validationData = csv.drop(inputData.index)
inputExpected = inputData.pop('Salary')
validationExpected = validationData.pop('Salary')

model = None

if input("Load model? y/n") != 'n':
    fname = '\\\\insrvr2\\folders$\\Kieran\\Desktop\\TF\\' + input("file name")
    model = keras.models.load_model(fname)

else:

    model = keras.Sequential([
        keras.layers.Flatten(input_shape=(5,)),
        keras.layers.Dense(4096 , activation='relu'),
        keras.layers.Dense(4096 , activation='relu'),
        keras.layers.Dense(1 , activation='relu'),
    ])


    

    model.compile(optimizer='adam', 
                loss='mean_squared_logarithmic_error',
                metrics=['mae'])

callbacks = [
        tf.keras.callbacks.EarlyStopping(
              monitor='val_loss'
            , patience=PATIENCE
            , verbose=0
            , restore_best_weights=True
            , mode='min'),
    ]

if input("train? y/n") != 'n':
    model.fit(inputData, inputExpected, batch_size=BATCH_SIZE, epochs=EPOCHS, validation_data=(validationData,validationExpected), callbacks=callbacks, shuffle=True)

print(len(validationData))
prediction = model.predict(validationData)
print(len(prediction))

#this outputs the actual function if the input is 1D
# for _ in range(100):
#     i = int(random.randrange(0,1000))
#     print(validationData[i], ',', prediction[i][0])

validationExpected = list(validationExpected)

print('\n\n\n')

for _ in range(100):
    i = int(random.randrange(0,len(validationExpected)-1))
    print(validationExpected[i], ',', prediction[i][0])

if input("Save model? y/n") == 'y':
    fname = '\\\\insrvr2\\folders$\\Kieran\\Desktop\\TF\\' + input("file name")
    if not os.path.exists(fname):
        os.mkdir(fname)
    model.save(fname )

