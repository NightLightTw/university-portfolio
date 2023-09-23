import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Activation, Dropout, BatchNormalization
from tensorflow.keras.optimizers import SGD, Adam
from tensorflow.keras.utils import to_categorical
import tensorflow as tf
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

Y_train = to_categorical(y_train) 
Y_test = to_categorical(y_test)

Epoch = 100
batch_size = 32
defaults = dict(
    dropout=0.2,
    hidden_layer_size=128,
    layer_1_size=128,
    layer_2_size=64,
    learn_rate=0.01,
    epochs=Epoch,
    batch_size = batch_size
    )

resume = sys.argv[-1] == "--resume"
wandb.init(config=defaults, resume=resume, entity="nightlighttw")
config = wandb.config
num_classes = Y_test.shape[1]

sgd = SGD(lr=config.learn_rate,nesterov=True)

if wandb.run.resumed:
    print("RESUMING")
    # restore the best model
    model = load_model(wandb.restore("model-best.h5").name)
else:
    model = Sequential()
    model.add(Dense(config.layer_1_size, input_shape=(77,), activation="relu"))
    model.add(Dense(config.hidden_layer_size, activation="relu"))
    model.add(BatchNormalization())
    model.add(Dropout(config.dropout))
    model.add(Dense(config.hidden_layer_size, activation="relu"))
    model.add(BatchNormalization())
    model.add(Dense(config.layer_2_size, activation="relu"))
    model.add(Dropout(config.dropout))
    model.add(BatchNormalization())
    model.add(Dense(num_classes, activation="softmax"))
    model.summary() 
    model.compile(loss='categorical_crossentropy', optimizer=sgd, metrics=['accuracy']) 
    
history = model.fit(X_train, Y_train,  validation_data=(X_test, Y_test),
          epochs=config.epochs,
          batch_size=config.batch_size,
          initial_epoch=wandb.run.step,  # for resumed runs
          callbacks=[WandbCallback()])
model.save("nn.h5")