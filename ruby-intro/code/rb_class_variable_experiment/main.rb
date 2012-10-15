#!/usr/bin/ruby
# encoding: utf-8

# Yardımcı
def dump(p)
  puts "#{p}: #{eval(p, TOPLEVEL_BINDING) || 'boş'}"
end

puts "A sınıfı tanımlanıyor"
class A
  attr :instance_variable

  CONSTANT = "#{self}_CONSTANT"
  @@class_variable = "#{self}_class_variable"
  @class_instance_variable = "#{self}_class_instance_variable"

  def initialize
    @instance_variable = "#{self}_instance_variable"
  end

  class << self
    attr :class_instance_variable
    def class_variable
      @@class_variable
    end
  end
end

puts "B < A sınıfı tanımlanıyor (değişiklik yapmadan)"
class B < A
end

puts "C < A sınıfı tanımlanıyor (değişiklik yaparak)"
class C < A
  CONSTANT = "#{self}_CONSTANT"
  @@class_variable = "#{self}_class_variable"
  @class_instance_variable = "#{self}_class_instance_variable"
end

puts "A sınıfından a nesnesi oluşturuluyor"
a = A.new
puts "B sınıfından b nesnesi oluşturuluyor"
b = B.new
puts "C sınıfından c nesnesi oluşturuluyor"
c = C.new

puts
dump 'A'
dump 'A::CONSTANT'
dump 'A.class_variable'
dump 'A.class_instance_variable'
dump 'a.instance_variable'
puts
dump 'B'
dump 'B::CONSTANT'
dump 'B.class_variable'
dump 'B.class_instance_variable'
dump 'b.instance_variable'
puts
dump 'C'
dump 'C::CONSTANT'
dump 'C.class_variable'
dump 'C.class_instance_variable'
dump 'c.instance_variable'
