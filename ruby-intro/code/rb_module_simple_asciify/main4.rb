#!/usr/bin/ruby
# encoding: utf-8

module Ascii
  # FIXME Daha basit bir ilklendirme?
  # FIXME Türkçeye özel, ama modül ismi (Ascii) genel
  CHARS = {
    'ı' =>  'i',
    'ğ' =>  'g',
    'ü' =>  'u',
    'ş' =>  's',
    'ö' =>  'o',
    'ç' =>  'c',
    'İ' =>  'I',
    'Ğ' =>  'G',
    'Ü' =>  'U',
    'Ş' =>  'S',
    'Ö' =>  'O',
    'Ç' =>  'C',
  }

  def self.turkish(text)
    # FIXME Her seferinde bu düzenli ifadeyi hesaplamak gerekmemeli
    re = Regexp.new '[' + CHARS.keys.join + ']'
    text.gsub(re) { |c| CHARS[c] }
  end
end

if __FILE__ == $PROGRAM_NAME
  # FIXME Dizgi üzerinden çağrılsa?  "ŞĞÜÖÇöçğüıİ".ascii gibi
  puts Ascii.turkish('ŞĞÜÖÇöçğüıİ')
end
