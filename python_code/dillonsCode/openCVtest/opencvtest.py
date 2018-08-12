import numpy as np
import cv2


cap = cv2.VideoCapture(0) # This is the first webcam

while True:
    ret, frame = cap.read()

    # apply gray frame

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    #test = cv2.cvtColor(frame, cv2.COLOR_BGR2XYZ) # XYZ is like a weird blue scale
    cv2.imshow('frame',frame) # Produces a regular webcam window
    cv2.imshow('gray',gray) # Produces a webcam window but everything is in gray scale
    #cv2.imshow('test', test)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release() # Always release or errors can happen
cv2.destroyAllWindows() 
