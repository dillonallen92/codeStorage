import numpy as np
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier

data = load_breast_cancer()

# print(data.feature_names) # names of all the features

# print(data.target_names) #names of the target features

x_train, x_test, y_train, y_test = train_test_split(data.data, data.target, test_size = 0.33)

model = RandomForestClassifier() # RandomForestClassifier is an object

model.fit(x_train, y_train)

# score the training data
print("Training data score is: " + str(model.score(x_train, y_train)))

# score the test data
print("Test data score is : " + str(model.score(x_test, y_test)))

# Now to predict something
predictions = model.predict(x_test)

print("Predictions are as follows:\n" + str(predictions))