#!/usr/bin/ruby
# encoding: utf-8

module Asciify
  # Modül Arayüzü

  Language = {}
  def Language.[](code)
    desc = super
    if not desc
      raise "'#{code}' geçerli bir dil kodu değil.  " +
            "Geçerli dil kodları #{self.keys.sort}"
    end
    desc
  end

  def self.describe(code, ascii)
    desc = Language[code] = {}
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

  def ascii(code=nil)
    desc = Language[code]
    self.gsub(desc[:re]) { |c| desc[:ascii][c] }
  end
end

# Dizgi arayüzünü etkinleştir
class String
  include Asciifiable
end

if __FILE__ == $0
  puts "şğüöçİı".ascii :tr
  puts "über straße".ascii :de
end
