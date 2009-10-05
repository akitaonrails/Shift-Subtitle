require 'time'
class SrtTime
  attr_accessor :operation, :amount
  def initialize(options = {})
    self.operation = options[:operation]
    self.amount = options[:amount]
  end
  
  def convert_time(time)
    time  = Time.parse(time).send(operation, amount)
    time  = ((time.strftime("%H:%M:%S") + ',%s') % (time.usec.to_s.rjust(6, '0')))
    
    time =~ /,(\d*)$/
    if $1.size > 3
      pad = ($1.size - 3) * (-1)
      time[0...pad]
    elsif $1.size < 3
      time.gsub(/,\d*$/, $1.rjust(3, '0'))
    else
      time
    end
  end
  
  def convert_line(line)
    if line =~ /(\d{2}:\d{2}:\d{2},\d{3}) --\> (\d{2}:\d{2}:\d{2},\d{3})/
      start_time = convert_time($1)
      finish_time = convert_time($2)
      line = "%s --> %s\n" % [start_time, finish_time]
    end
    line
  end
end