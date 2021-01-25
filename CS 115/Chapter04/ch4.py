import graphics

win = graphics.GraphWin()

p = graphics.Point(50,60)

p.getX()
p.getY()

from graphics import *

from graphics import GraphWin, Point

p.draw(win)

p2 = Point(140, 100)

p2.draw(win)

#########################################
win = GraphWin('Shapes')
center = Point(100,100)
circ = Circle(center, 30)
circ.setFill('blue')
circ.draw(win)
label = Text(center, "Red Circle")
label.setSize(20)
label.draw(win)

rect = Rectangle(Point(30,30), Point(70,70))
rect.setFill('orange')
rect.draw(win)

line = Line(Point(20,30), Point(180, 165))
line.draw(win)

oval = Oval(Point(20,150), Point(180, 199))
oval.setFill('green')
oval.draw(win)