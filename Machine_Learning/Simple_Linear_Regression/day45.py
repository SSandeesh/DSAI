 # day45

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error
import pickle

salarydf=pd.read_csv(r"C:\Users\sande\Downloads\Salary_Data.csv")

x=salarydf.iloc[:,:1]
y=salarydf.iloc[:,1] 

# Train and Test Data Split
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.20,random_state=0)

# Train the Linear Regression Model
regressor = LinearRegression()
regressor.fit(x_train,y_train)

# Predict the test set
y_pred=regressor.predict(x_test)

# Compare predicted and actual salaries from test set
comparison= pd.DataFrame({"Actual":y_test,"Predicted":y_pred})


# Visualize the train set
plt.scatter(x_train,y_train,color="red")
plt.plot(x_train,regressor.predict(x_train),color="blue")
plt.title("Salary VS Experience(Training Set)",c="r")
plt.xlabel("Years of Experience")
plt.ylabel("Salary")
plt.show()

# Visualize the test set
plt.scatter(x_test, y_test, color='red') 
plt.plot(x_test, regressor.predict(x_test), color='blue')
plt.title('Salary vs Experience (Test set)',c="r")
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.show()

# day 46

m_slope = regressor.coef_
c_intercept = regressor.intercept_


# SSR
y_mean=np.mean(y)
SSR=np.sum((y_pred-y_mean)**2)
# SSE
y=y[0:6]
SSE=np.sum((y-y_pred)**2)
# SST
SST = SSR + SSE
# R^2
r_square = 1-(SSR/SST)

# Check Model Performance

# Bias = training points
bias = regressor.score(x_train,y_train)
# variance = testing points
variance = regressor.score(x_test,y_test)
#Mean Squared Error
train_mse = mean_squared_error(y_train, regressor.predict(x_train))
test_mse = mean_squared_error(y_test, y_pred)

print("Intercept",c_intercept)
print("m-slope",m_slope)
print(f"r_square is {r_square:.2f}")
print(f"Training Score {bias:.2f}")
print(f"Testing Score {variance:.2f}")
print(f"Training MSE: {train_mse:.2f}")
print(f"Test MSE: {test_mse:.2f}")

# Save the trained Model to disk
filename = "Linear_Regression_Model.pkl"
with open(filename, "wb") as file:
    pickle.dump(regressor,file)
print("Model has been pickled and saved as Linear_Regression_Model.pkl ")