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

  def initialize(*coords, r)
    super *coords # XXX z,y yok; bu kısım artık DRY
    @r = r
  end

  def perimeter
    2 * Math::PI * @r
  end

  def area
    Math::PI * @r**2
  end

  # FIXME DRY ama ekstra satır
  alias :super_to_s :to_s
  def to_s
    "#@r@#{super_to_s}"
  end

  # FIXME Point'te overload edilen bazı işleçler
  # örneğin +, ==, çocuk sınıfta anlamlı değil.
end

def main
  c = Circle.new 3, 5, 2
  puts "#{c} çemberinin alanı: #{c.area}"
  puts "#{c} çemberi #{c.move(7, 9)} çemberine dönüştü"
end

if __FILE__ == $0
    main
end
