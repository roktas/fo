#!/usr/bin/ruby
# encoding: utf-8

# Codify our versioning schema
class Version
  # create a version object from a version spec (a hash or string)
  def initialize(arg, overwrite = {})
    @v =
      case arg
      when Hash
        arg.merge(overwrite)
      when String
        parse(arg).merge(overwrite)
      else
        raise ArgumentError, 'A version hash or string must be given'
      end
  end

  # parse a version string
  def parse(string)
    Hash[
      [:base, :snapshot, :vendor, :debian].zip(string.match(/
        ([^~]+)~
        ([^-]+)-
        (\d+xix)
        (\d+)
      /x)[1..4])
    ]
  end

  # compute next version object
  def next_when_changed(what = :source)
    case what
    when :source
      today = Time.new.strftime('%y%m%d')
      self.class.new @v, snapshot:
        @v[:snapshot].start_with?(today) ? @v[:snapshot].succ : today + '00'
    when :debian # only debian packaging files were changed
      self.class.new @v.merge debiani: @v[:debian].succ
    else
      raise ArgumentError, 'what changed?'
    end
  end

  # assemble source version
  def source(v = {})
    (v[:base] || @v[:base]) + '~' + (v[:snapshot] || @v[:snapshot])
  end

  # all version parts should be accessable via fallback
  def method_missing(key, *)
    super unless @v.has_key? key
    @v[key]
  end

  # assemble a version from version parts
  def to_s
    source + '-' + @v[:vendor] + @v[:debian]
  end
end

if __FILE__ == $PROGRAM_NAME
  version = Version.new '1.0.1~12031000-0xix1'
  puts "Current version                 : #{version}"
  puts "Next version when changed source: #{version.next_when_changed :source}"
  puts "Next version when changed debian: #{version.next_when_changed :debian}"
end
