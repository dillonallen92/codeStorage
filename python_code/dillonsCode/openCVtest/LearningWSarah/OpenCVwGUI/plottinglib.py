# Plotting Library to make interactive matplotlib easier to get to

import matplotlib.pyplot as plt 
from matplotlib.widgets import Slider, Button

def plotImages(image1, image2="", image3="", image4=""):
    '''
        This function takes in (up to) 4 images and configures a figure to
        plot these images.
    '''
    count = 1 
    fig = plt.figure()
    try:
        if(image2.any()):
            count = count + 1
    except:
        print("Error at image 2.")
    try:
        if(image3.any()):
            count = count + 1
    except:
        print("Error at image 3.")
    try:
        if(image4.any()):
            count = count + 1
    except:
        print("Error at image 4.")
    
    if count == 1:
        ax.imshow(image1)
        ax.set_xticks([])
        ax.set_yticks([])
        ax.set_title("Image 1")

    if(count == 2):
        ax = fig.add_subplot(121)
        ax2 = fig.add_subplot(122)

        # add images
        ax.imshow(image1)
        ax.set_xticks([])
        ax.set_yticks([])
        ax.set_title("Image 1")

        ax2.imshow(image2)
        ax2.set_xticks([])
        ax2.set_yticks([])
        ax2.set_title("Image 2")

    
    if(count == 3):
        ax = fig.add_subplot(131)
        ax2 = fig.add_subplot(132)
        ax3 = fig.add_subplot(133)

        ax.imshow(image1)
        ax.set_xticks([])
        ax.set_yticks([])
        ax.set_title("Image 1")

        ax2.imshow(image2)
        ax2.set_xticks([])
        ax2.set_yticks([])
        ax2.set_title("Image 2")

        ax3.imshow(image3)
        ax3.set_xticks([])
        ax3.set_yticks([])
        ax3.set_title("Image 3")
    
    if(count == 4):
        ax = fig.add_subplot(221)
        ax2 = fig.add_subplot(222)
        ax3 = fig.add_subplot(223)
        ax4 = fig.add_subplot(224)

        ax.imshow(image1)
        ax.set_xticks([])
        ax.set_yticks([])
        ax.set_title("Image 1")

        ax2.imshow(image2)
        ax2.set_xticks([])
        ax2.set_yticks([])
        ax2.set_title("Image 2")

        ax3.imshow(image1)
        ax3.set_xticks([])
        ax3.set_yticks([])
        ax3.set_title("Image 3")

        ax4.imshow(image2)
        ax4.set_xticks([])
        ax4.set_yticks([])
        ax4.set_title("Image 4")

    return fig


def addSlider(fig, target, sliderName, startPoint, endPoint, on_change_type=""):
    
    if target == "image1" or target == "image 1" or target == "img1":
        try:
            image1_slider_ax = fig.add_axes([0.25, 0.15, 0.65, 0.03])
            image1_slider = Slider(image1_slider_ax, sliderName, startPoint, endPoint)
            
        except:
            print("Fig is probably not defined.")
