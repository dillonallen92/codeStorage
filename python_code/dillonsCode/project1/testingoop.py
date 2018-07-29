''' This is a test of how OOP works in Python '''

class Dog:


    ''' Pythons version of a constructor '''

    def __init__(self, name, age):
        self.name = name
        self.age = age

    def bark(self):
        print("My name is {}" .format(self.name))


doga = Dog("John", 6)

print("{} is {} years old".format(doga.name, doga.age))

doga.bark()

