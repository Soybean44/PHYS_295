import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import scipy

dartboard_data = pd.read_csv("combined_dart_strikes.csv")
dart_strikes = dartboard_data["Dart strike"].to_numpy()

my_data = pd.read_csv("Shahid_Sovereign_dartboard.csv")
my_strikes = my_data["Dart Strike"].to_numpy()

def mean(arr):
    return sum(arr)/len(arr)

def std(arr): 
    return np.sqrt((arr - mean(arr))/(len(arr)-1))
