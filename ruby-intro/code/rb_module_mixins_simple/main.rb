#!/usr/bin/ruby
# encoding: utf-8

module Turkish
  def turkish_upcase
    chars = {
      'ı' => 'I', 'i' => 'İ', 'ğ' => 'Ğ', 'ü' => 'Ü',
      'ö' => 'Ö', 'ç' => 'Ç', 'ş' => 'Ş'
    }
    upcase.gsub Regexp.new("[#{chars.keys.join}]") { |c| chars[c] }
  end
end

class String
  include Turkish
end

puts 'ıişğüöç'.turkish_upcase if __FILE__ == $PROGRAM_NAME
