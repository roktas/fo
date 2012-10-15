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
    @x > other.x or @x == other.x
  end

  def <=(other)
    @x < other.x or @x == other.x
  end

  def ==(other)
    @x == other.x and @y == other.y
  end

  def move(x, y)
    @x += x
    @y += y
    self
  end

  def to_s
    "(#@x,#@y)"
  end

  # XXX Artık DRY (Point yok)
  # FIXME Sadece iki nokta topluyor, nokta sayısını sınırlamasak?
  def self.add(this, that)
    self.new this.x + that.x, this.y + that.y # FIXME self'e gerek var mı?
  end
end

def main
  puts Point.add Point.new(3, 5), Point.new(9, 7)
end

if __FILE__ == $0
    main
end
