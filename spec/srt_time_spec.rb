require File.join(File.dirname(__FILE__), 'spec_helper')
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib', 'srt_time'))

describe SrtTime do
  it "should be able to shift right the time adding a float amount" do
    @srt_time = SrtTime.new(:operation => :"+", :amount => 1.6)
    @srt_time.convert_time("00:00:01,500").should == "00:00:03,100"
    @srt_time.convert_time("00:00:01,050").should == "00:00:02,650"
    @srt_time.convert_time("00:01:24,051").should == "00:01:25,651"
    @srt_time.convert_time("00:01:59,400").should == "00:02:01,000"
  end
  
  it "should be able to shift left the time subtracting a float amount" do
    @srt_time = SrtTime.new(:operation => :"-", :amount => 1.6)
    @srt_time.convert_time("00:00:01,500").should == "23:59:59,900"
    @srt_time.convert_time("00:00:01,050").should == "23:59:59,450"
    @srt_time.convert_time("00:01:24,051").should == "00:01:22,451"
    @srt_time.convert_time("00:01:59,400").should == "00:01:57,800"
  end
  
  it "should convert a srt time range line in the correct format" do
    @srt_time = SrtTime.new(:operation => :"+", :amount => 1.6)
    @srt_time.convert_line("00:00:01,500 --> 00:00:02,100").should == "00:00:03,100 --> 00:00:03,700\n"
  end
end