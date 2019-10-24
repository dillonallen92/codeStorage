import plottinglib as pltlib 
import cv2
import matplotlib.pyplot as plt 

img1 = cv2.imread('funny2.jpg')
img2 = cv2.imread('funnycat.jpg')
img3 = cv2.imread('funnycat.jpg')

pltlib.plotImages(img1, img2, img3)

plt.show()