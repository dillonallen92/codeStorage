# This test will make a simple Qt Window
# Then I will build on top of this

from PyQt5.QtWidgets import QApplication, QLabel
app = QApplication([])
label = QLabel("Hello World!")
label.show()
app.exec_()