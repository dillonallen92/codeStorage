import pandas as pd
from sklearn.naive_bayes import MultinomialNB
import numpy as np


df = pd.read_csv("/Users/dballen/Documents/iCloud Drive (Archive)/Documents/GitHub/codeStorage/python_code/dillonsCode/dataScienceLectures/machine_learning_examples-master/nlp_class/spambase.data").values


np.random.shuffle(df)

x = df[:,:48]
y = df[:,-1]

xtrain = x[:-100,]
ytrain = y[:-100,]

xtest = x[-100:,]
ytest = y[-100:,]

# Class the Naive Bayes classifier
model = MultinomialNB()
model.fit(xtrain, ytrain)
print("Classification rate for NB is {}".format(model.score(xtest, ytest)))

# Call the Adaboost classifier
from sklearn.ensemble import AdaBoostClassifier
model2 = AdaBoostClassifier()
model2.fit(xtrain, ytrain)
print("Adaboost classifier rate is {}".format(model2.score(xtest,ytest)))
