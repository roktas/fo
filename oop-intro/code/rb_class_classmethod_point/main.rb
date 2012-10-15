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

  # + işlecini overload ederek sınırsız sayıda noktayı da
  # toplama olanağına kavuştuk.
  def +(other=nil)
    # Nesne metodundan sınıf metodu (origin) nasıl çağrılır?
    # Point.origin olabilir ama DRY değil, cevap: self.class
    other ||= self.class.origin
    self.class.new @x + other.x, @y + other.y
  end

  def move(x, y)
    @x += x
    @y += y
    self
  end

  def to_s
    "(#@x,#@y)"
  end

  # Sınıf metodları

  # Her seferinde self. yazmak yerine sınıfı yarıp metodu
  # içine koyalım.  Böylesi daha DRY

  # Burada self ne değer alır?  Point
  class << self
    def origin
      # new metodunun alıcısı kim?  self
      # self burada ne değer alır?  Point (yani sınıf)
      new *ORIGIN
    end

    def distance(here, there=nil)
      there ||= origin
      Math.sqrt((here.x - there.x)**2 + (here.y - there.y)**2)
    end
  end
end

def main
  p, q, r = Point.new(3, 5), Point.new(9, 7), Point.new(-2, 5)
  puts "Noktalar: #{p} #{q} #{r}"
  puts "Toplam noktası: #{p + q + r}"
  puts "#{p} - #{q} uzaklığı: #{Point.distance(p, q)}"
  puts "#{p} - orijin uzaklığı: #{Point.distance(p)}"
end

if __FILE__ == $0
    main
end
