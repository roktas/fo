#!/usr/bin/ruby
# encoding: utf-8

class Engine
  # Motor'la ilgili tüm ortak akıl burada...
  def start
    puts "başla"
  end
  def stop
    puts "dur"
  end
end

class Car
  def initialize
    @engine = Engine.new
  end

  # Hafta sonu turu
  def sunday_drive
    @engine.start
    # Gez dolaş ve dön...
    @engine.stop
  end
end

if __FILE__ == $0
  car = Car.new
  car.sunday_drive
end
