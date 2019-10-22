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

class CanvasApp(App):
 
    def build(self):

        # Layout stuff
        self.box = BoxLayout(orientation='horizontal', spacing=20)
        self.image1 = Image()
        self.image1.source = 'funnycat.jpg'
        # self.box.add_widget(self.image1)
        self.texture = self.image1.texture
        self.box.add_widget(self.texture)

        return self.box
        # return Builder.load_string(kvWidget)
   

CanvasApp().run()
