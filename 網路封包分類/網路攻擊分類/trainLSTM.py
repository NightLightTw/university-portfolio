import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Activation, Dropout, BatchNormalization
from tensorflow.keras.layers import Dense, Embedding
from tensorflow.keras.layers import LSTM
from tensorflow.keras.optimizers import SGD, Adam
from tensorflow.keras.utils import to_categorical
import wandb
from wandb.keras import WandbCallback
import sys

flow1 = pd.read_csv('./flow1_v1.csv', header=None)
flow2 = pd.read_csv('./flow2_v1.csv', header=None)
flow1.insert(77,column="label",value=0)
flow2.insert(77,column='label',value=1)
data = flow1.append(flow2,ignore_index=True)
y_data = data['label']
y_data = np.array(y_data)
x_data = data.drop(columns=['label'])
x_data = np.array(x_data)

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(x_data, y_data, test_size=0.2, random_state=666)

X_train = np.reshape(X_train, (X_train.shape[0], X_train.shape[1], 1))
X_test = np.reshape(X_test, (X_test.shape[0], X_test.shape[1], 1))

Epoch = 100
batch_size = 128
defaults = dict(
    dropout=0.5,
    layer_size=150,
    learn_rate=0.01,
    epochs=Epoch,
    batch_size = batch_size
    )

resume = sys.argv[-1] == "--resume"
wandb.init(project="twoFlow" ,config=defaults, resume=resume, entity="nightlighttw")
config = wandb.config
num_classes = 1

sgd = SGD(lr=config.learn_rate,nesterov=True)
Adam = Adam(lr=config.learn_rate)

if wandb.run.resumed:
    print("RESUMING")
    # restore the best model
    model = load_model(wandb.restore("model-best.h5").name)
else:
    model = Sequential()
    model.add(LSTM(config.layer_size,input_shape = (X_train.shape[1], 1), return_sequences = True))
    model.add(Dropout(config.dropout))
    model.add(LSTM(config.layer_size))
    model.add(Dropout(config.dropout))
    model.add(Dense(num_classes, activation='sigmoid'))
    model.compile(loss = 'binary_crossentropy',optimizer='adam',metrics=['accuracy'])
    
history = model.fit(X_train, y_train,  validation_data=(X_test, y_test),
          epochs=config.epochs,
          batch_size=config.batch_size,
          initial_epoch=wandb.run.step,  # for resumed runs
          callbacks=[WandbCallback()])
model.save("LSTM_best.h5")