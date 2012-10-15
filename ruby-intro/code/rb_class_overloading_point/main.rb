#!/usr/bin/ruby
# encoding: utf-8

class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def >(other)
    @x > other.x
  end

  def <(other)
    @x < other.x
  end

  def >=(other)
    @x > other.x or @x == other.x
  end

  def <=(other)
    @x < other.x or @x == other.x
  end

  def ==(other)
    @x == other.x and @y == other.y
  end

  def to_s
    "(#@x,#@y)"
  end
end

def main
  p, q = Point.new(3, 5), Point.new(9, 7)
  puts "#{p} noktası #{q} noktasının " + (p < q ? "solunda" : "sağında")
end

if __FILE__ == $0
    main
end
