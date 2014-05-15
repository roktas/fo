# encoding: utf-8

class Archive
  attr_reader :file

  def initialize(file)
    @file = file
  end

  # new yerine create metodu kullanıyoruz
  def self.create(file)
    unless ext = File.extname(file)[1..-1]
      $stderr.puts 'Dosya türü belirlenemedi'
      exit 1
    end
    Object.const_get(ext.strip.capitalize).send :new, file
  rescue NameError
      $stderr.puts "Desteklenmeyen dosya türü: #{ext}"
      exit 1
  end

  # new metodunun kullanılmasını engelle
  private_class_method :new
end

class Zip < Archive
  def extract
    puts "Zip dosya #{file}"
  end
end

class Rar < Archive
  def extract
    puts "Rar dosya #{file}"
  end
end

def main
  arch = Archive.create ARGV[0]
  arch.extract
end

main if __FILE__ == $PROGRAM_NAME
