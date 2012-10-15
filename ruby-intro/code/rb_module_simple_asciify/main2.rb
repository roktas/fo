#!/usr/bin/ruby
# encoding: utf-8

# FIXME Diğer diller için de genelleştirsek, örneğin Almanca
module Turkish
  CHARS = Hash[*%w(
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
  )]
  RE = Regexp.new '[' + CHARS.keys.join + ']'

  def ascii
    self.gsub(RE) { |c| CHARS[c] }
  end
end

class String
  include Turkish
end

if __FILE__ == $0
  puts "ŞĞÜÖÇöçğüıİ".ascii
end
