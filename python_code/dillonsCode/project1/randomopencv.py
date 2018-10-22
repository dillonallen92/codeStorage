import numpy as np
from matplotlib import pyplot as plt
import cv2

def dispImage(img):
    # Just display an image and wait for key to break
    cv2.imshow("image", img)
    cv2.waitKey(0)
    cv2.destroyAllWindows

def dispBlurredImage(img, blurType):

    # define the blur type here

    if blurType == 'Gaussian' or blurType == 'gaussian':
        blur = cv2.GaussianBlur(img, (5,5), 0)
    if blurType == 'Average' or blurType == 'average' or blurType == 'avg':
        blur = cv2.blur(img, (5,5))
    if blurType == 'Median' or blurType == 'median':
        blur = cv2.medianBlur(img, 5)
    
    # apply the blur and plot original vs blur

    plt.subplot(121), plt.imshow(img), plt.title("Original")
    plt.xticks([]), plt.yticks([])
    plt.subplot(122), plt.imshow(blur), plt.title("Blurred")
    plt.xticks([]), plt.yticks([])
    plt.show()


img1 = cv2.imread("rand1.png",1)

print("Welcome to the image blurring program! You can choose Average, Gaussian, or Median filtering.")
userInput = input("What type of blurring do you want? ")
if userInput == 'None' or userInput == 'none' or userInput == "":
    dispImage(img1)
else:
    dispBlurredImage(img1, userInput)


