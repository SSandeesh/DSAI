import numpy as np
import pandas as pd

dset=pd.read_csv(r"C:\Users\sande\Downloads\Restaurant_Reviews.tsv",delimiter='\t',quoting=3)

import re
import nltk
from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer

corpus=[]

for i in range(len(dset)):
    review =re.sub('[^a-zA-Z]',' ',dset["Review"][i])
    review=review.lower()
    review=review.split()
    ps=PorterStemmer()
    review=[ps.stem(word)for word in review if not word in set(stopwords.words("english"))]
    review=" ".join(review)
    corpus.append(review)
    
# BoW
from sklearn.feature_extraction.text import CountVectorizer
cv=CountVectorizer()
x=cv.fit_transform(corpus).toarray()
y=dset.iloc[:,1].values

# train test split
from sklearn.model_selection import train_test_split
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.20,random_state=0)

from sklearn.tree import DecisionTreeClassifier
classifier=DecisionTreeClassifier()
classifier.fit(x_train,y_train)

y_pred=classifier.predict(x_test)

from sklearn.metrics import confusion_matrix, accuracy_score
cm=confusion_matrix(y_test,y_pred)
ac=accuracy_score(y_test, y_pred)

print(cm)
print(ac)

bias=classifier.score(x_train,y_train)
variance=classifier.score(x_test,y_test)

print(f"Bias is {bias}")
print(f"Variance is {variance}")