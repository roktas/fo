#!/usr/bin/ruby
# encoding: utf-8

class Point
  def initialize(x, y)
    @x, @y = x, y
  end

  # FIXME Her nitelik için böyle okuyucu mu yazacağız?
  def x
    @x
  end

  def y
    @y
  end

  def isright(other)
    @x > other.x
  end

  def isleft(other)
    @x < other.x
  end

  def isabove(other)
    @y > other.y
  end

  def isbelow(other)
    @y < other.y
  end

  def isequal(other)
    @x == other.x and @y == other.y
  end

  def move(x, y)
    @x += x
    @y += y
    # FIXME Bu metod (şu noktada) ne döner?  Zararı?
  end

  def to_s
    "(#{@x},#{@y})"
  end
end

def main
  p, q = Point.new(3, 5), Point.new(9, 7)
  puts "#{p} noktası #{q} noktasının " + (p.isleft(q) ? 'solunda' : 'sağında')
end

main if __FILE__ == $PROGRAM_NAME
