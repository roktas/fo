#!/usr/bin/ruby
# encoding: utf-8

EŞANLAMLAR = %w(
  defa
  kere
  kez
  sefer
)
SÖZLER = %w(
  evet
  gittim
  gördüm
  maşallah
  tövbe
)

class Object
  SÖZLER.each do |söz|
    define_method(söz.to_sym) { Proc.new { puts söz } }
  end
end

class Fixnum
  def turkish_times(söyle)
    times &söyle
  end
  EŞANLAMLAR.each do |eşanlam|
    eval "alias #{eşanlam} :turkish_times"
  end
end

if __FILE__ == $PROGRAM_NAME
  1.kez gördüm
  2.sefer gittim
  3.defa evet
  41.kere maşallah
  100.kere tövbe
  # Bu bir hikaye miydi?  Hmm, hayır!
end
