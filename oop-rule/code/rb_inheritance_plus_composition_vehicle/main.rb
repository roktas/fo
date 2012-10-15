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

class GasolineEngine < Engine
  # Benzinli Motor
end

class DieselEngine < Engine
  # Dizel Motor
end

class Car
  def initialize
    @engine = GasolineEngine.new
  end

  # Hafta sonu turu
  def sunday_drive
    puts "Motor tipi: #{@engine.class}"
    @engine.start
    # Gez dolaş ve dön...
    @engine.stop
  end

  # Dizel'e çevir
  def switch_to_diesel
    @engine = DieselEngine.new
  end
end

if __FILE__ == $0
  car = Car.new
  car.sunday_drive
  car.switch_to_diesel
  car.sunday_drive
end
