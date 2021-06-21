t1 = pd.read_csv('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\temp.csv')
v1 = pd.read_csv('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\temp.csv')
s = t1.pop('Salary')
u = v1.pop('Salary')

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

model.fit(t1, s, batch_size=50, epochs=1000, validation_data=(v1,u), callbacks=callbacks, shuffle=True)

prediction = model.predict(v1)

#this outputs the actual function if the input is 1D
# for _ in range(100):
#     i = int(random.randrange(0,1000))
#     print(v1[i], ',', prediction[i][0])

print('\n\n\n')

for _ in range(100):
    i = int(random.randrange(0,1000))
    print(u[i], ',', prediction[i][0])
