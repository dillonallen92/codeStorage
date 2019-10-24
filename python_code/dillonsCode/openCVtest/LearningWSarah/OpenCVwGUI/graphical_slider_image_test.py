import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider, Button, RadioButtons
import cv2

# Port our image in
img = cv2.imread('funnycat.jpg')

# Made a function to handle calling the "blurring" function, this can be more
# complicated later...
def blurred_image(kernel_size):
    blur = cv2.blur(img, (kernel_size, kernel_size))
    return blur

# Creating our figure and subplots 
fig = plt.figure()
ax = fig.add_subplot(121)
ax2 = fig.add_subplot(122)

# Adjust the subplots region to leave some space for the sliders and buttons
fig.subplots_adjust(left=0.25, bottom=0.25)


# Draw the initial plot
# Add the first image
ax.imshow(img)
ax.set_xticks([])
ax.set_yticks([])
ax.set_title("Original Image")
# add the first image again (since initially there should be no filtering)
ax2.imshow(img)
ax2.set_xticks([])
ax2.set_yticks([])
ax2.set_title("Blurred Image")

# Add a slider for our blurring Kernel

# Define an axes area and draw a slider in it
kernel_slider_ax  = fig.add_axes([0.25, 0.15, 0.65, 0.03])
kernel_slider = Slider(kernel_slider_ax, 'Kernel Size', 1, 10)


# When the slider changes, we replace the original image (ax2 version) with the blurred image
def sliders_on_changed(val):
    # Have to cast the slider value as an int to properly calculate the kernel
    ax2.imshow(blurred_image((int)(kernel_slider.val)))
    fig.canvas.draw_idle()

kernel_slider.on_changed(sliders_on_changed)

# Add a button for resetting the parameters
reset_button_ax = fig.add_axes([0.8, 0.025, 0.1, 0.04])
reset_button = Button(reset_button_ax, 'Reset', hovercolor='0.975')
def reset_button_on_clicked(mouse_event):
    kernel_slider.reset()
reset_button.on_clicked(reset_button_on_clicked)

plt.show()