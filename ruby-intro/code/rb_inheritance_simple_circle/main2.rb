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

  def +(other)
    other ||= origin
    # XXX: self.class → Point, ama sadece bu sınıfta!
    self.class.new @x + other.x, @y + other.y
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

  class << self
    def origin
      new(*ORIGIN)
    end

    def distance(here, there = nil)
      there ||= origin
      Math.sqrt((here.x - there.x)**2 + (here.y - there.y)**2)
    end
  end
end

class Circle < Point
  attr_reader :r

  def initialize(x, y, r)
    super x, y # FIXME: DRY değil; neden x, y ayrıca geçiyor?
    @r = r
  end

  def perimeter
    2 * Math::PI * @r
  end

  def area
    Math::PI * @r**2
  end

  def to_s
    # FIXME: Neden x, y?  DRY değil
    "#{@r}@(#{x},#{y})"
  end

  # FIXME: Point'te overload edilen bazı işleçler
  # örneğin +, ==, çocuk sınıfta anlamlı değil.
end

def main
  c = Circle.new 3, 5, 2
  puts "#{c} çemberinin alanı: #{c.area}"
  puts "#{c} çemberi #{c.move(7, 9)} çemberine dönüştü"
end

main if __FILE__ == $PROGRAM_NAME
