import winsound
import numpy as np 
import pandas as pd 

data = pd.read_csv("notes.csv")
data_at_4th_octave = data.loc[data['octave'] == 4]

'''
print(data_at_4th_octave.head())
print(len(data_at_4th_octave))
'''

notes_at_4th_octave = data_at_4th_octave['note_sharp']
freq_at_4th_octave = data_at_4th_octave['hertz']
print(freq_at_4th_octave)

for freq in freq_at_4th_octave:
    winsound.Beep(round(freq), 3000)
