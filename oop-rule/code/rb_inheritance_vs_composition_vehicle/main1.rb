#!/usr/bin/ruby
# encoding: utf-8

class Vehicle
  # Araç'la ilgili tüm ortak akıl burada...

  def start_engine
    puts "başla"
  end
  def stop_engine
    puts "dur"
  end
end

class Car < Vehicle
  # Hafta sonu turu
  def sunday_drive
    start_engine
    # Gez dolaş ve dön...
    stop_engine
  end
end

if __FILE__ == $0
  car = Car.new
  car.sunday_drive
end
