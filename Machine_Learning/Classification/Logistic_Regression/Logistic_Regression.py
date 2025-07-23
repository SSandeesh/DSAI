import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.metrics import classification_report

dset = pd.read_csv(r"C:\Users\sande\Downloads\dataset.csv")

x = dset.iloc[:,[2,3]].values
y = dset.iloc[:,-1].values

# Train_Test split
x_train, x_test, y_train, y_test = train_test_split(x,y,test_size=0.20,random_state=0)

# standardizing 
sc = StandardScaler()
x_train = sc.fit_transform(x_train)
x_test = sc.transform(x_test)

# Logistic Regression
classifier = LogisticRegression()
classifier.fit(x_train, y_train)

y_pred = classifier.predict(x_test)

# Confusion Matrix
cm = confusion_matrix(y_test,y_pred)

# Accuracy
ac=accuracy_score(y_test, y_pred)

# Classification Report
cr=classification_report(y_test, y_pred)

# Bias and Variance
bias = classifier.score(x_train,y_train)
variance = classifier.score(x_test,y_test)

# Print the Results
print(f"Confusion Matrix :\n {cm}")
print(f"Accuracy : {ac}")
print(f"Classification Report :\n {cr}")
print(f"Bias : {bias}")
print(f"Variance : {variance}")
