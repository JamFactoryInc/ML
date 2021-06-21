
from random import shuffle


def fTest(x_arg):
    return 2**x_arg 

# training data
t = np.random.choice(np.arange(-10,10, .01),5000 )
t1 = []
for i in range(len(t)):
    t1.append(t[i])
s = []
for i in range(len(t)):
    s.append(fTest(t[i]))
t1 = np.array(t1)
s = np.array(s)

# validation set
v = np.random.choice(np.arange(-10,10, .01),5000 )
v1 = []
for i in range(len(v)):
    v1.append(v[i])
u = []
for i in range(len(v)):
    u.append(fTest(v[i]))
v1 = np.array(v1)
u = np.array(u)

model = keras.Sequential([
    keras.layers.Flatten(input_shape=(1,)),
	keras.layers.Dense(32 , activation='relu'),
	keras.layers.Dense(16 , activation='relu'),
	keras.layers.Dense(8),
	keras.layers.Dense(1)
])

callbacks = [
    tf.keras.callbacks.EarlyStopping(monitor='val_loss', patience=10, verbose=0)
]


model.compile(optimizer='adam', 
              loss='mean_squared_logarithmic_error',
              metrics=['mae','accuracy'])

model.fit(t1, s, batch_size=50, epochs=100, validation_data=(v1,u),callbacks=callbacks, shuffle=True)

prediction = model.predict(v1)

for _ in range(100):
    i = int(random.randrange(0,1000))
    print(v1[i], ',', prediction[i][0])