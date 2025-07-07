import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

dataset=pd.read_csv(r"C:\Users\sande\Downloads\Data (1).csv")
dataset

x = dataset.iloc[:,:3].values
y = dataset.iloc[:,3:].values

# Filling Missing Numerical Values

from sklearn.impute import SimpleImputer

imputer = SimpleImputer()

imputer = imputer.fit(x[:,1:3])
x[:,1:3] = imputer.transform(x[:,1:3])

# Encoding Categorical to Numerical Data

from sklearn.preprocessing import LabelEncoder

labelencoder_x = LabelEncoder()

labelencoder_x.fit_transform(x[:,0])
x[:,0] = labelencoder_x.fit_transform(x[:,0])

labelencoder_y = LabelEncoder()
y = labelencoder_y.fit_transform(y)

# train and test dataset split

from sklearn.model_selection import train_test_split
x_train,x_test,y_train,y_test = train_test_split(x,y,train_size=0.7,random_state=0)

#FEATURE SCALING

from sklearn.preprocessing import StandardScaler

sc_X = StandardScaler() 

x_train = sc_X.fit_transform(x_train)

x_test = sc_X.transform(x_test)



