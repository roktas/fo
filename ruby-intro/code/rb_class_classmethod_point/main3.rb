#!/usr/bin/ruby
# encoding: utf-8

class Point
  attr_reader :x, :y

  ORIGIN = 0, 0

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
    @x > other.x || @x == other.x
  end

  def <=(other)
    @x < other.x || @x == other.x
  end

  def ==(other)
    @x == other.x && @y == other.y
  end

  def move(x, y)
    @x += x
    @y += y
    self
  end

  def to_s
    "(#{@x},#{@y})"
  end

  # Sınıf metodları

  # FIXME: Bu metodda geçen Point DRY değil
  def Point.add(this, that)
    Point.new this.x + that.x, this.y + that.y # Point'e gerek var mı?
  end
end

def main
  puts Point.add Point.new(3, 5), Point.new(9, 7)
end

main if __FILE__ == $PROGRAM_NAME
