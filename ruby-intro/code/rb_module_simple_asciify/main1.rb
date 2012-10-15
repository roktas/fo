#!/usr/bin/ruby
# encoding: utf-8

module LanguageUtils
  # Modül Arayüzü

  # FIXME Basit bir sözlük yerine ayrı bir nesne (ör. Struct) yapsak?
  Language = {}
  def Language.[](code)
    desc = super
    if not desc
      raise "'#{code}' geçerli bir dil kodu değil.  " +
            "Geçerli dil kodları #{self.keys.sort}"
    end
    desc
  end

  # FIXME Kod eşdeğerlerini yönetmiyor, ör. :en == :us
  def self.describe_language(code, desc)
    d = Language[code] = {}
    d.merge! desc
    if d.has_key? :chars
      d[:chars] = Hash[*desc[:chars]]
      d[:re] = Regexp.new '[' + d[:chars].keys.join + ']'
    end
  end

  def self.language(code=nil)
    code ? Language[code] : @language
  end
  def self.language=(code)
    @language = Language[code]
  end

  def self.yes(code=nil)
    language(code)[:yesno].first
  end
  def self.no(code=nil)
    language(code)[:yesno].last
  end

  # Diller

  module English
    LanguageUtils.describe_language :en,
      :yesno => %w(yes no)
  end

  module Turkish
    LanguageUtils.describe_language :tr,
      :chars => %w(
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
      ),
      :yesno => %w(evet hayır)

      def self.spesific_util
        puts "#{self}: bu dile özgü bir metod"
      end
  end

  module German
    LanguageUtils.describe_language :de,
      :chars => %w(
        ä a
        Ä A
        é e
        ö o
        Ö O
        ü u
        Ü U
        ß ss
      ),
      :yesno => %w(ja nein)
  end

  # Dizgi Arayüzü

  module String
    def ascii(code=nil)
      desc = LanguageUtils.language(code)
      return self if not desc.has_key? :chars
      self.gsub(desc[:re]) { |c| desc[:chars][c] }
    end
  end

  # Modülü öntanımlı dil olarak İngilizce ile ilkle
  self.language = :en
end

# Dizgi arayüzünü etkinleştir
class String
  include LanguageUtils::String
end

if __FILE__ == $0
  LanguageUtils.language = :tr
  puts "şğüöçİı".ascii
  puts "über straße".ascii :de
  puts LanguageUtils.yes :tr
  puts LanguageUtils::Turkish.spesific_util
end
