#!/usr/bin/python
# encoding: utf-8

import math

class Point(object):
    ORIGIN = (0, 0)

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

    def __repr__(self):
        return "(%s,%s)" % (self.x, self.y)

    @classmethod
    def add(self, *points):
        return Point(
            sum(point.x for point in points),
            sum(point.y for point in points),
        )

    @classmethod
    def origin(self):
        return Point(*self.ORIGIN)

    @classmethod
    def distance(self, here, there=None):
        if not there: there = self.origin()
        return math.sqrt((here.x - there.x)**2 + (here.y - there.y)**2)

def main():
    p, q, r = Point(3, 5), Point(9, 7), Point(-2, 5)
    print "Noktalar: %s %s %s" % (p, q, r)
    print "Toplam noktası: %s" % Point.add(p, q, r)
    print "%s - %s uzaklığı: %f" % (p, q, Point.distance(p, q))
    print "%s - orijin uzaklığı: %f" % (p, Point.distance(p))

if __name__ == "__main__":
    main()
