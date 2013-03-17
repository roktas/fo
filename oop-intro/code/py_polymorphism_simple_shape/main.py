#!/usr/bin/python
# encoding: utf-8

import math

class Point(object):
    ORIGIN = (0, 0)

    name = "nokta"

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
        return "%s-(%s,%s)" % (self.name, self.x, self.y)

    def move(self, x, y):
        self.x += x
        self.y += y

    @classmethod
    def origin(self):
        return Point(*self.ORIGIN)

    @classmethod
    def add(self, *points):
        return Point(
            sum(point.x for point in points),
            sum(point.y for point in points),
        )

    @classmethod
    def distance(self, here, there=None):
        if not there: there = self.origin()
        return math.sqrt((here.x - there.x)**2 + (here.y - there.y)**2)

class Circle(Point):
    name = "çember"

    def __init__(self, x, y, r):
        super(Circle, self).__init__(x, y)
        self.r = r
    def __str__(self):
        return "%s-%s@(%s,%s)" % (self.name, self.r, self.x, self.y)

    def perimeter(self):
        return 2 * math.pi * self.r

    def area(self):
        return math.pi * self.r**2

    @classmethod
    def add(self, *points):
        raise Exception, "Bu şeklin toplanması anlamlı değil"

class Square(Circle):
    FACTOR = 2/math.sqrt(2)

    name = "kare"

    def perimeter(self):
        return 4*self.FACTOR*self.r

    def area(self):
        return (self.FACTOR*self.r)**2

def main():
    shapes = [Circle(3, 5, 2), Square(9, 4, 1)]
    for shape in shapes:
        print "%s şeklinin alanı: %s" % (shape, shape.area())

if __name__ == "__main__":
    main()
