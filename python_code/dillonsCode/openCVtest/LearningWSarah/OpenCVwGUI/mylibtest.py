import plottinglib as pltlib 
import matplotlib.pyplot as plt 
import cv2


img1 = cv2.imread('funny2.jpg')
img2 = cv2.imread('funnycat.jpg')
img3 = cv2.imread('funnycat.jpg')

fig = pltlib.plotImages(img1, img2, img3)
pltlib.addSlider(fig, "image1", "mySlider", 1, 10)

plt.show()