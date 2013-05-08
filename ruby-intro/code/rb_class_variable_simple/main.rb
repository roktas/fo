#!/usr/bin/ruby
# encoding: utf-8

class Point
  attr_reader :x, :y

  ORIGIN = 0, 0

  @@count = 0

  def initialize(x, y)
    @x, @y = x, y
    @@count += 1
  end

  def to_s
    "(#@x,#@y)"
  end

  # Sınıf metodları

  class << self
    def report
      puts "Nokta sayısı: #@@count"
    end
  end
end

def main
  p, q, r = Point.new(3, 5), Point.new(9, 7), Point.new(-2, 5)
  Point.report
end

main if __FILE__ == $PROGRAM_NAME
