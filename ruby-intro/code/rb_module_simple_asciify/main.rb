#!/usr/bin/ruby
# encoding: utf-8

module Asciify
  # Modül Arayüzü

  LANGUAGE = {}
  def LANGUAGE.[](code)
    desc = super
    unless desc
      fail "'#{code}' geçerli bir dil kodu değil.  " +
           "Geçerli dil kodları #{keys.sort}"
    end
    desc
  end

  def self.describe(code, ascii)
    desc = LANGUAGE[code] = {}
    desc[:ascii] = Hash[*ascii]
    desc[:re]    = Regexp.new '[' + desc[:ascii].keys.join + ']'
  end

  describe :tr, %w(
    ı i
    ğ g
    ü u
    ş s
    ö o
    ç c
    İ I
    Ğ G
    Ü U
    Ş S
    Ö O
    Ç C
  )

  describe :de, %w(
    ä a
    Ä A
    é e
    ö o
    Ö O
    ü u
    Ü U
    ß ss
  )

  # Dizgi Arayüzü

  def ascii(code = nil)
    desc = LANGUAGE[code]
    gsub(desc[:re]) { |c| desc[:ascii][c] }
  end
end

# Dizgi arayüzünü etkinleştir
class String
  include Asciifiable
end

if __FILE__ == $PROGRAM_NAME
  puts 'şğüöçİı'.ascii :tr
  puts 'über straße'.ascii :de
end
