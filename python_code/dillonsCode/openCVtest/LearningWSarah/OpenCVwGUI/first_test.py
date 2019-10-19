from kivy.app import App
 
from kivy.lang import Builder
 
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.image import Image
from kivy.uix.button import Button
from kivy.uix.label import Label
from kivy.graphics.texture import Texture
import cv2
 
kvWidget = """
 
MyWidget:
 
    orientation: 'vertical'
    
    canvas:
    
        Rectangle:
        
            size: self.size
            
            pos: self.pos
            
            source: 'funnycat.jpg'
            
"""
'''
class MyWidget(BoxLayout):
 
    def __init__(self, **kwargs):
        
        super().__init__(**kwargs)
'''
class CanvasApp(App):
 
    def build(self):

        '''
        # Image test
        img1 = cv2.imread('funnycat.jpg')
        buff1 = cv2.flip(img1, 0)
        buff = str(buff1)
        text1 = Texture.create(size=(img1.shape[1], img1.shape[0]),colorfmt='bgr')
        text1.blit_buffer(buff, colorfmt='bgr', bufferfmt='ubyte')
        '''
        # Layout stuff
        self.box = BoxLayout(orientation='horizontal', spacing=20)
        self.image1 = Image()
        self.image1.source = 'funnycat.jpg'
        self.box.add_widget(self.image1)
        '''
        self.box = BoxLayout(orientation='horizontal', spacing=20)
        self.img = Image(source='funnycat.jpg')
        self.btn = Button(text='Hello', on_press = self.changeImage, size_hint=(.1,.1))
        self.label = Label(text='something here')
        self.box.add_widget(self.img)
        self.box.add_widget(self.label)
        self.box.add_widget(self.btn)
        '''
        return self.box
        # return Builder.load_string(kvWidget)
    '''
    def changeImage(self, instance):
        img2 = Image(source='funny2.jpg')
        self.img.source = img2.source
    '''

CanvasApp().run()