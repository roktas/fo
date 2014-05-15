# encoding: utf-8

class Base
  attr_reader :file

  def initialize(file)
    @file = file
  end
end

class Zip < Base
  def extract
    puts "Unzipping #{file}"
  end
end

class Rar < Base
  def extract
    puts "Unraring #{file}"
  end
end

class Archive
  FORMATS = {
    '.rar' => Rar,
    '.zip' => Zip,
  }
  class << self
    def new(file)
      ext = File.extname file
      if handler = FORMATS[ext]
        handler.send :new, file
      else
        $stderr.puts "Desteklenmeyen dosya biçimi: #{ext}"
        exit 1
      end
    end
  end
end

def main
  arch = Archive.new ARGV[0]
  arch.extract
end

main if __FILE__ == $PROGRAM_NAME
