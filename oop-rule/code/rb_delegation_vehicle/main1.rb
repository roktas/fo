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
  def sunday_drive
    puts "Motor tipi: #{@engine.class}"
    start
    # Cruise out into the country and return...
    stop
  end
  def switch_to_diesel
    @engine = DieselEngine.new
  end
  def start
    @engine.start
  end
  def stop
    @engine.stop
  end
end

if __FILE__ == $0
  car = Car.new
  car.sunday_drive
  car.switch_to_diesel
  car.sunday_drive
end
