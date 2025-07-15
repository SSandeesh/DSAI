# 15 july

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import PolynomialFeatures

dset = pd.read_csv(r"C:\Users\sande\Downloads\emp_sal.csv")

x=dset.iloc[:,1:2].values
y=dset.iloc[:,2].values

# LinearRegression Model
regressor = LinearRegression()
regressor.fit(x,y)

# Predict the output
regressor.predict([[6]])
accuracy = regressor.score(x,y)

# Polynomial Regression
poly_Regressor = PolynomialFeatures(degree=5)
 
x_poly = poly_Regressor.fit_transform(x)

regressorL_2 = LinearRegression()
regressorL_2.fit(x_poly,y)

# Predict the outputs
ploy_model_pred = regressorL_2.predict(poly_Regressor.fit_transform([[6]]))
ploy_model_pred
poly_r2 = regressorL_2.score(x_poly, y)


# Plot the graph for LinearRegression 
plt.scatter(x,y,color = "r")
plt.plot(x,regressor.predict(x),color = "blue")
plt.title("Linear Regression Model")
plt.xlabel("Position Level")
plt.ylabel("Salary")
plt.show()

# plot the graph for Polynomial Regression
plt.scatter(x,y,color = "r")
plt.plot(x,regressorL_2.predict(x_poly),color = "blue")
plt.title("Polynomial Regression Model")
plt.xlabel("Position Level")
plt.ylabel("Salary")
plt.show()


print(f"Linear Regression R^2 Score: {accuracy:.4f}")
print(f"Polynomial Regression R^2 Score: {poly_r2:.4f}")