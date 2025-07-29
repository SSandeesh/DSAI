# 24 July

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.metrics import classification_report

dataset=pd.read_csv(r"D:\Notes\Materials(DSAI)\July\24th - KNN\Social_Network_Ads.csv")

# Dependent and Independent Variables
x = dataset.iloc[:, [2, 3]].values #selects columns 2 and 3 
y = dataset.iloc[:, -1].values

# Split the dataset into train and test
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.20,random_state=0)

# Feature Scaling
scaler=StandardScaler()
x_train=scaler.fit_transform(x_train)
x_test=scaler.fit_transform(x_test)

# KNN Model
classifier=KNeighborsClassifier()
classifier.fit(x_train,y_train)

# Y-Prediction
y_pred=classifier.predict(x_test)

# Confusion Matrix
cm=confusion_matrix(y_test, y_pred)

# Model's Accuracy
ac=accuracy_score(y_test,y_pred)

# Classification Report
cr = classification_report(y_test, y_pred)

bias = classifier.score(x_train,y_train)
variance = classifier.score(x_test,y_test)

print(f"Confusion Matrix\n{cm}")
print(f"Accuracy {ac}")
print(f"Classification Report\n{cr}")
print(bias)
print(variance)

