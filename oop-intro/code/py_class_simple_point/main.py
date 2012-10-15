#!/usr/bin/python
# encoding: utf-8

class Point:
    def __init__(self, x, y):
        self.x, self.y = x, y

    def isright(self, other):
        return self.x > other.x

    def isleft(self, other):
        return self.x < other.x

    def isabove(self, other):
        return self.y > other.y

    def isbelow(self, other):
        return self.y < other.y

    def isequal(self, other):
        return self.x is other.x and self.y is other.y

    def move(self, x, y):
        self.x += x
        self.y += y

    def __repr__(self):
        return "(%s,%s)" % (self.x, self.y)

def main():
    p, q = Point(3, 5), Point(9, 7)
    where = "solunda" if p.isleft(q) else "sağında"
    print "%s noktası %s noktasının %s." % (p, q, where)

if __name__ == "__main__":
    main()
