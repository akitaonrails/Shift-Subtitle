class SrtTime
  attr_accessor :operation, :amount
  def initialize(options = {})
    self.operation = options[:operation]
    self.amount = options[:amount]
  end
  def convert_line(line)
    if line =~ /(\d{2}:\d{2}:\d{2},\d{3}) --\> (\d{2}:\d{2}:\d{2},\d{3})/
      start_time  = Time.parse($1).send(operation, amount)
      start_time  = ((start_time.strftime("%H:%M:%S") + ',%s') % start_time.usec)
      finish_time = Time.parse($2).send(operation, amount)
      finish_time = ((finish_time.strftime("%H:%M:%S") + ',%s') % finish_time.usec)

      start_pad = start_time =~ /,(\d*)$/
      start_pad = ($1.size - 3) * (-1)

      finish_pad = finish_time =~ /,(\d*)$/
      finish_pad = ($1.size - 3) * (-1)
      line = "%s --> %s\n" % [start_time[0...start_pad], finish_time[0...finish_pad]]
    end
    line
  end
end