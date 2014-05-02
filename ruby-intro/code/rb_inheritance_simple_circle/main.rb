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
    other ||= self.class.origin
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

  def initialize(*coords, r)
    super(*coords)
    @r = r
  end

  def perimeter
    2 * Math::PI * @r
  end

  def area
    Math::PI * @r**2
  end

  def to_s
    # XXX: Ooooo!  Artık DRY ama kara büyü :-/
    "#{@r}@#{self.class.superclass.instance_method(:to_s).bind(self).call}"
  end

  # XXX: Anlamlı olmayan işleçler şuna benzer bir şey yapılabilir
  def +(*) # argümanlarla ilgilenmediğimizden * diyoruz
    fail "+ işleci #{self.class} sınıfı için anlamlı değil"
  end
end

def main
  c = Circle.new 3, 5, 2
  puts "#{c} çemberinin alanı: #{c.area}"
  puts "#{c} çemberi #{c.move(7, 9)} çemberine dönüştü"
end

main if __FILE__ == $PROGRAM_NAME
