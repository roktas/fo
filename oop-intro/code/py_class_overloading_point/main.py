#!/usr/bin/python
# encoding: utf-8

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

    def move(self, x, y):
        self.x += x
        self.y += y

    def __repr__(self):
        return "(%s,%s)" % (self.x, self.y)

def main():
    p, q = Point(3, 5), Point(9, 7)
    where = "solunda" if p < q else "sağında"
    print "%s noktası %s noktasının %s" % (p, q, where)

if __name__ == "__main__":
    main()
