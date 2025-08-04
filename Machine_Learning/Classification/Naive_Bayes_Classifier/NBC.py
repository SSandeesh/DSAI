# 29 July 

import pandas as pd
from sklearn.metrics import accuracy_score,confusion_matrix, classification_report
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import MinMaxScaler
import warnings
warnings.filterwarnings("ignore")
# Read the data
data=pd.read_csv(r"D:\Notes\Materials(DSAI)\July\24th - KNN\Social_Network_Ads.csv")

x=data.iloc[:,2:4].values
y=data.iloc[:,-1:].values

# train test split
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.2,random_state=0)

# Standard Scaler
scaler=StandardScaler()
x_train_scaled=scaler.fit_transform(x_train)
x_test_scaled=scaler.fit_transform(x_test)

# Min Max Scaler
minmax=MinMaxScaler()
x_train_minmax=minmax.fit_transform(x_train)
x_test_minmax=minmax.fit_transform(x_test)

# ----Gaussian Naive Bayes----
from sklearn.naive_bayes import GaussianNB
gnb=GaussianNB()
gnb.fit(x_train,y_train)

y_pred_gnb=gnb.predict(x_test)

# ----Bernoulli Naive Bayes----
from sklearn.naive_bayes import BernoulliNB
bnb=BernoulliNB()
bnb.fit(x_train_scaled,y_train)

y_pred_bnb=bnb.predict(x_test_scaled)

# ----Multinomial Naive Bayes----
from sklearn.naive_bayes import MultinomialNB
mnb=MultinomialNB()
mnb.fit(x_train_minmax,y_train)

y_pred_mnb=mnb.predict(x_test_minmax)


print("----Gaussian Naive Bayes----")
print(accuracy_score(y_test, y_pred_gnb))
print(confusion_matrix(y_test, y_pred_gnb))
print(classification_report(y_test, y_pred_gnb))
print("----Bernoulli Naive Bayes----")
print(accuracy_score(y_test, y_pred_bnb))
print(confusion_matrix(y_test, y_pred_bnb))
print(classification_report(y_test, y_pred_bnb))
print("----Multinomial Naive Bayes----")
print(accuracy_score(y_test, y_pred_mnb))
print(confusion_matrix(y_test, y_pred_mnb))
print(classification_report(y_test, y_pred_mnb))