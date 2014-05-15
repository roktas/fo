# encoding: utf-8

class Base
  attr_reader :file

  def initialize(file)
    @file = file
  end
end

class Zip < Base
  def extract
    puts "Zip dosya #{file}"
  end
end

class Rar < Base
  def extract
    puts "Rar dosya #{file}"
  end
end

class Archive
  class << self
    def new(file)
      unless ext = File.extname(file)[1..-1]
        $stderr.puts 'Dosya türü belirlenemedi'
        exit 1
      end
      Object.const_get(ext.strip.capitalize).send :new, file
    rescue NameError
        $stderr.puts "Desteklenmeyen dosya türü: #{ext}"
        exit 1
    end
  end
end

def main
  arch = Archive.new ARGV[0]
  arch.extract
end

main if __FILE__ == $PROGRAM_NAME
