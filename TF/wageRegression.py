# from __future__ import absolute_import, division, print_function, unicode_literals

# import numpy as np
# import pandas as pd
# import matplotlib.pyplot as plt

# import tensorflow as tf

# def make_input_fn(data_df, label_df, num_epochs = 10, shuffle=True, batch_size=100):
# 	def input_function():
# 		ds = tf.data.Dataset.from_tensor_slices((dict(data_df), label_df))
# 		if shuffle:
# 			ds = ds.shuffle(1000)
# 		ds = ds.batch(batch_size).repeat(num_epochs)
# 		return ds
# 	return input_function

# def make_feature_cols(catcols, numcols):
# 	feature_cols = []

# 	for fname in CAT_COLS:
# 		vocab = dftrain[fname].unique()
# 		feature_cols.append(tf.feature_column.categorical_column_with_vocabulary_list(fname, vocab))

# 	for fname in NUM_COLS:
# 		feature_cols.append(tf.feature_column.numeric_column(fname, dtype=tf.float32))	
	
# 	return feature_cols

# dftrain = pd.read_csv('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\train.csv')
# dfeval = pd.read_csv('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\eval.csv')

# y_train = dftrain.pop('Salary')
# y_eval = dfeval.pop('Salary')


# CAT_COLS = []
# NUM_COLS = ['Amount','Interval']

# train_input_fn = make_input_fn(dftrain, y_train, num_epochs=200)
# eval_input_fn = make_input_fn(dfeval, y_eval, num_epochs=1)

# linear_est = tf.estimator.LinearClassifier(feature_columns=make_feature_cols(CAT_COLS,NUM_COLS))

# print('Starting training')
# linear_est.train(train_input_fn)

# print('Starting eval')
# result = list(linear_est.predict(eval_input_fn))
# for i in range(len(result)-1):
# 	print(result[i]['probabilities'][1], ',', y_eval.loc[i])

# print('\n\n\n\n')

# for i in range(len(result)-1):
# 	print(result[i]['probabilities'])

from __future__ import absolute_import, division, print_function, unicode_literals
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import tensorflow as tf
def make_input_fn(data_df, label_df, num_epochs = 10, shuffle=True, batch_size=200):
	def input_function():
		ds = tf.data.Dataset.from_tensor_slices((dict(data_df), label_df))
		if shuffle:
			ds = ds.shuffle(10000)
		ds = ds.batch(batch_size).repeat(num_epochs)
		return ds
	return input_function
def make_feature_cols(catcols, numcols):
	feature_cols = []
	for fname in CAT_COLS:
		vocab = dftrain[fname].unique()
		feature_cols.append(tf.feature_column.categorical_column_with_vocabulary_list(fname, vocab))
	for fname in NUM_COLS:
		feature_cols.append(tf.feature_column.numeric_column(fname, dtype=tf.float32))	
	
	return feature_cols
dftrain = pd.read_csv('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\temp.csv')
dfeval = pd.read_csv('\\\\insrvr2\\folders$\\Kieran\\Desktop\\Py\\temp.csv')
y_train = dftrain.pop('Salary')
y_eval = dfeval.pop('Salary')
# dftrain = pd.read_csv('https://storage.googleapis.com/tf-datasets/titanic/train.csv')
# dfeval = pd.read_csv('https://storage.googleapis.com/tf-datasets/titanic/eval.csv')
# y_train = dftrain.pop('survived')
# y_eval = dfeval.pop('survived')

CAT_COLS = []
NUM_COLS = ['Amount','Interval']
# CAT_COLS = ['sex','n_siblings_spouses','parch','class','deck','embark_town','alone']
# NUM_COLS = ['age','fare']
train_input_fn = make_input_fn(dftrain, y_train, num_epochs=2000)
eval_input_fn = make_input_fn(dfeval, y_eval, num_epochs=1)
linear_est = tf.estimator.LinearClassifier(feature_columns=make_feature_cols(CAT_COLS,NUM_COLS))
print('Starting training')
linear_est.train(train_input_fn)
print('Starting eval')
result = linear_est.evaluate(eval_input_fn)
print(result)
result = linear_est.predict(eval_input_fn)

result = list(result)
for i in range(len(result)-1):
	print(result[i]['probabilities'][1], ',', y_eval.loc[i])
print('\n\n\n\n')


