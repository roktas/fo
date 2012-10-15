#!/usr/bin/ruby
# encoding: utf-8

class Point
  attr_reader :x, :y

  ORIGIN = 0, 0
  NAME   = 'nokta'

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

  def +(other=nil)
    other ||= origin
    self.class.new @x + other.x, @y + other.y
  end

  def move(x, y)
    @x += x
    @y += y
    self
  end

  def to_s
    "(#@x,#{@y})"
  end

  # Sınıf metodları

  class << self
    def name
      NAME
    end

    def origin
      new *ORIGIN
    end

    def distance(here, there=nil)
      there ||= origin
      Math.sqrt((here.x - there.x)**2 + (here.y - there.y)**2)
    end
  end
end

class Circle < Point
  attr_reader :r

  NAME   = 'çember'

  def initialize(*coords, r)
    super *coords
    @r = r
  end

  def +(*)
    raise "Bu şeklin toplanması anlamı değil"
  end

  def perimeter
    2 * Math::PI * @r
  end

  def area
    Math::PI * @r**2
  end

  def to_s
    "#@r@(#{self.x},#{self.y})" # XXX DRY değil ama okunur
  end
end

class Square < Circle
  FACTOR = 2/Math.sqrt(2)
  NAME   = 'kare'

  def perimeter
    4 * FACTOR * self.r
  end

  def area
    (FACTOR * self.r)**2
  end
end

def main
  [Circle.new(3, 5, 2), Square.new(9, 4, 1)].each do |shape|
    puts "#{shape} şeklinin alanı: #{shape.area}"
  end
end

if __FILE__ == $0
    main
end
