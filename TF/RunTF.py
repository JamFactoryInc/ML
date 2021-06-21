from __future__ import absolute_import, division, print_function, unicode_literals
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow import keras
import random
import math
import os

tffile = 'WaveNetDrawAmount'

while True:
    userInput = input("rerun y/n")
    if userInput == 'y':

        if input("use previous tf file? y/n") == 'y':
            pass
        else:
            tffile = input("File to read: ")
        f = open("\\\\insrvr2\\folders$\\Kieran\\Desktop\\TF\\"+tffile+".py")
        execStr = f.read()
        f.close()
        try:
            exec(execStr)
        except Exception as e:
            print("Error:")
            print(e)


    elif userInput == 'n':
        break


