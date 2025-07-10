import streamlit as stl
import numpy as np
import pickle

# load the Pickle file 
model = pickle.load(open(r"D:\PSpyder\Linear_Regression_Model.pkl","rb"))  # rb- read binary

# Title of the Streamlit App
stl.title("Salary Prediction App")

# Add the Description of the App
stl.write("This app predicts the Salary based on years of experience using a Simple Linear Regression Model.")

# Add Input Widget for user to enter years of Experience
years_experience = stl.number_input("Enter Years od Experience : ",min_value=0.0, max_value=50.0, value=1.0, step=0.5)

# When the Button is Clicked
if stl.button("Predict Salary"):
    # Makes Prediction Using Trained Model 
    experience_input = np.array([ [years_experience]]) # convert to 2D array for prediction
    prediction = model.predict(experience_input)

    # Displays the Result
    stl.success(f"The predicted Salary for {years_experience} years of experience is : ${prediction[0]:,.2f}$")

# Information about the Model
stl.write("The Model was trained using a dataset of Salaries and Years of Experience") 