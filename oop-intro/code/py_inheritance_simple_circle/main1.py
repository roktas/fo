#!/usr/bin/python
# encoding: utf-8

import math

class Point(object):
    def __init__(self, x, y):
        self.x, self.y = x, y

    def __eq__(self, other):
        return self.x is other.x and self.y is other.y
    def __lt__(self, other):
        return self.x < other.x
    def __gt__(self, other):
        return self.x > other.x
    def __le__(self, other):
        return self < other or self == other
    def __ge__(self, other):
        return self > other or self == other

    def __str__(self):
        return "(%s,%s)" % (self.x, self.y)

    def move(self, x, y):
        self.x += x
        self.y += y

class Circle(Point):
    def __init__(self, x, y, r):
        Point.__init__(self, x, y)
        self.r = r
    def __str__(self):
        return "%s@%s" % (self.r, Point.__str__(self))

    def perimeter(self):
        return 2 * math.pi * self.r

    def area(self):
        return math.pi * self.r**2

def main():
    c = Circle(3, 5, 2)
    print "%s çemberinin alanı: %f " % (c, c.area())
    print "%s çemberi " % c,
    c.move(7, 9)
    print "%s çemberine dönüştü." % c

if __name__ == "__main__":
    main()
