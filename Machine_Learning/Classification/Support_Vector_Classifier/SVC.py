# 25 July

import pandas as pd
import numpy as np

# Dataset
dataset=pd.read_csv(r"D:\Notes\Materials(DSAI)\July\24th - KNN\Social_Network_Ads.csv")

# Dependent and Independent
x=dataset.iloc[:, [2, 3]].values
y=dataset.iloc[:,-1].values

# Split the Dataset
from sklearn.model_selection import train_test_split
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.20,random_state=0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc=StandardScaler()
x_train=sc.fit_transform(x_train)
x_test=sc.fit_transform(x_test)

# Train the Model
# Support Vector Machine
from sklearn.svm import SVC
classifier=SVC()
classifier.fit(x_train,y_train)

# Prediction
y_pred=classifier.predict(x_test)

# Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)
print(cm)

# Model's Accuracy 
from sklearn.metrics import accuracy_score 
ac = accuracy_score(y_test, y_pred)
print(ac) 

bias = classifier.score(x_train,y_train)
print(bias) 

variance = classifier.score(x_test,y_test)
print(variance)

# Classification Report
from sklearn.metrics import classification_report
cr = classification_report(y_test, y_pred)
cr