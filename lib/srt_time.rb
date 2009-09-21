class SrtTime
  TIME_FORMAT_REGEX = /(\d{2}:\d{2}:\d{2},\d{3}) --\> (\d{2}:\d{2}:\d{2},\d{3})/
  TIME_FORMAT = "%s --> %s\n"
  
  include Comparable
  attr_accessor :sec, :msec
  
  # accepts initialization with the following arguments
  #   hour, min, sec, msec
  #   sec, msec
  def initialize(*args)
    args.map! { |d| d.to_i }
    if args.size == 4 # [hour, min, sec, msec]
      hour, min, sec, msec = *args
      args = [(hour * 3600) + (min * 60) + sec, msec]
    end
    if args.size == 2 # [sec, msec]
      self.sec, self.msec = *args
    else
      raise ArgumentError.new("Require 2 or 4 arguments")
    end
  end
  
  # accepts string inputs in the following formats:
  #   00:09:30,500
  #   45,210
  def self.parse(time)
    if time =~ /^(\d{2}):(\d{2}):(\d{2}),(\d{3})$/
      SrtTime.new($1, $2, $3, $4)
    elsif time =~ /^(\d{2}),(\d{3})$/
      SrtTime.new($1, $2)
    end
  end
  
  def +(srt_time)
    tmp = self.to_f + srt_time.to_f
    SrtTime.new(*tmp.to_s.split(".").map{ |d| d.to_i})
  end
  
  def -(srt_time)
    return SrtTime.new(0,0) if srt_time.to_f > self.to_f
    tmp = self.to_f - srt_time.to_f
    SrtTime.new(*tmp.to_s.split(".").map{ |d| d.to_i})
  end
  
  def to_f
    "#{self.sec}.#{self.msec}".to_f
  end
  
  def to_s
    seconds = self.sec
    hours = seconds / 3600; seconds = seconds % 3600
    minutes = seconds / 60; seconds = seconds % 60
    milli = "0" * (3 - self.msec.to_s.size).abs
    "%02d:%02d:%02d,#{self.msec}#{milli}" % [hours, minutes, seconds, self.msec]
  end
  
  def <=>(value)
    self.to_f <=> value.to_f
  end
end