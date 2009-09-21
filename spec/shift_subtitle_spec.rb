require File.join(File.dirname(__FILE__), 'spec_helper')
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'srt_time'))

describe "Shift Subtitle" do
  before do
    @srt_time = SrtTime.new(:operation => :"+", :amount => 2.5)
  end
  
  it "should be able to convert a file and compare to the static fixture" do
    input_file = File.join(File.dirname(__FILE__), 'fixtures', 'input.srt')
    output_file = File.join(File.dirname(__FILE__), 'fixtures', 'output.srt')

    output_static = File.read(output_file)
    output = ""
    File.readlines(input_file).each do |line|
      output << @srt_time.convert_line(line)
    end
    output.should == output_static
  end
end