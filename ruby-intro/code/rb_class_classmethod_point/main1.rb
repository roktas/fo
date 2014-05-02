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
    @x == other.x || @y == other.y
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

  # XXX: Sınırsız sayıda nokta topluyor
  # FIXME: Fakat toplamayı + ile yapsak?
  def self.add(*points)
    # XXX: new metodunun alıcısı kim?  self
    # self burada ne değer alır?  Point (yani sınıf)
    new points.map(&:x).sum, points.map(&:x).sum
  end

  def self.origin
    new(*ORIGIN)
  end

  def self.distance(here, there = nil)
    there ||= origin # origin metodunun alıcısı?  self → Point
    Math.sqrt((here.x - there.x)**2 + (here.y - there.y)**2)
  end

  # FIXME: Sınıf metodlarını böyle her seferinde self. ile mi
  # yazacağız.  Pek DRY değil.
end

# XXX: Array sınıfına bir yama yapıyoruz.  Ruby'de Python'daki gibi
# hazır bir "sum" metodu yok, ama bunu yazmak çok kolay.
class Array
  def sum
    # XXX: vektörden skalara dönüştürme ihtiyacı varsa
    # inject'i hatırlayın
    reduce(nil) { |sum, x| sum ? sum + x : x }
  end
end

def main
  p, q, r = Point.new(3, 5), Point.new(9, 7), Point.new(-2, 5)
  puts "Noktalar: #{p} #{q} #{r}"
  puts "Toplam noktası: #{Point.add(p, q, r)}"
  puts "#{p} - #{q} uzaklığı: #{Point.distance(p, q)}"
  puts "#{p} - orijin uzaklığı: #{Point.distance(p)}"
end

main if __FILE__ == $PROGRAM_NAME
