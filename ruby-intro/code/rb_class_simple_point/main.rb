#!/usr/bin/ruby
# encoding: utf-8

class Point
  # XXX Her nitelik için okuyucu yazmamız gerekmiyor
  attr_reader :x, :y, :color
  # RENK = %w(blue red green black)
  RENK = { "blue" => true, "red" => true, "green" => true, "black" => true }

  def color=(verilen)
    if RENK.include?(verilen)
      @color = verilen
    else
      raise "Hatali renk: #{verilen}"
    end
  end

  def initialize(x, y)
    @x, @y = x, y
    @color = "black"
  end

  # Ruby'de "doğrulayıcı" (predicator) böyle yazılır
  def right?(other)
    @x > other.x
  end

  def left?(other)
    @x < other.x
  end

  def above?(other)
    @y > other.y
  end

  def below?(other)
    @y < other.y
  end

  # FIXME foo.equal?(bar) yerine foo == bar yazılamaz mı?

  def equal?(other)
    @x == other.x and @y == other.y
  end

  def move(x, y)
    @x += x
    @y += y
    # XXX Taşımadan sonra nesnenin kendisini dön ki
    # çağıran ayrı bir atama yapma zorunda kalmasın
    self
  end

  def to_s
    "(#@x,#@y)"
  end
end

def main
  p, q = Point.new(3, 5), Point.new(9, 7)
  puts "#{p} noktasi #{q} noktasinin " + (p.left?(q) ? "solunda" : "saginda")
  p.color = "blue"
  puts p.color
end

if __FILE__ == $0
    main
end
