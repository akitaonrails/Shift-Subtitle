require File.join(File.dirname(__FILE__), 'spec_helper')
require File.join(File.dirname(__FILE__), '..', 'lib', 'srt_time')

describe SrtTime do
  it "should be able to parse a regular string such as 00:00:00,000" do
    time = SrtTime.new(10,9,8,200)
    time.to_s.should == "10:09:08,200"
    
    time2 = SrtTime.parse("10:09:08,200")
    time.to_s.should == time2.to_s
    
    time3 = SrtTime.new(200,300)
    time3.to_s.should == "00:03:20,300"
    
    time4 = SrtTime.new(200,"320")
    time4.to_s.should == "00:03:20,320"
    
    time5 = SrtTime.parse("00:00:04,320")
    time5.to_s.should == "00:00:04,320"
  end
  
  it "should not be able to parse irregular time such as 00:00,0000" do
    time = SrtTime.parse("10:10,1010")
    time.should be_nil
    
    time = SrtTime.parse("100:1:20,200")
    time.should be_nil
    
    lambda { SrtTime.new(1,2,3,4,5) }.should raise_error(ArgumentError)
  end
  
  it "should be able to calculate time additions" do
    (SrtTime.new(10,200) + SrtTime.new(5,250)).should == SrtTime.new(15,450)
    (SrtTime.new(10,700) + SrtTime.new(5,350)).should == SrtTime.new(16,'050')
  end
  
  it "should be able to calculate time subtractions" do
    (SrtTime.new(10,700) - SrtTime.new(5,250)).should == SrtTime.new(5,450)
    (SrtTime.new(10,100) - SrtTime.new(5,900)).should == SrtTime.new(4,200)
    (SrtTime.new(1,100) - SrtTime.new(2,200)).should == SrtTime.new(0,0)
  end
  
  it "should be able to be comparable" do
    SrtTime.new(10,100).should == SrtTime.new(10,100)
    SrtTime.new(10,101).should > SrtTime.new(10,100)
    SrtTime.new(10,100).should < SrtTime.new(10,101)
    SrtTime.new(1,0).should_not == SrtTime.new(2,0)
  end
end