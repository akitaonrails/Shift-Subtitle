require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), '..', 'lib', 'srt_time')

describe "Shift Subtitle" do
  it "should be able to convert a file and compare to the static fixture" do
    input_file = File.join(File.dirname(__FILE__), 'fixtures', 'input.srt')
    output_file = File.join(File.dirname(__FILE__), 'fixtures', 'output.srt')

    output_static = File.read(output_file)
    output = ""
    amount = SrtTime.parse("02,500")
    File.readlines(input_file).each do |line|
      if line =~ SrtTime::TIME_FORMAT_REGEX
        start_time  = SrtTime.parse($1) + amount
        finish_time = SrtTime.parse($2) + amount
        line = SrtTime::TIME_FORMAT % [start_time.to_s, finish_time.to_s]
      end
      output << line
    end
    output.should == output_static
  end
end