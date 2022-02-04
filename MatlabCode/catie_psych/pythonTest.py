from pandas.io.sql import SQLAlchemyRequired
import numpy as np 
import pandas as pd 

df = pd.read_excel("smr.xlsx")
print(df.head())