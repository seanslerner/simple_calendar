require 'spec_helper.rb'

describe SimpleCalendar::ViewHelpers do

  describe "calendar" do
  end

  describe "start_date" do
    it "should return the first sunday on or before the 1st" do
      calendar = Calendar.new
      calendar.start_date(Date.new(2012,3,10)).should eql(Date.new(2012,2,26))
    end
  end

  describe "end_date" do
    it "should return the last saturday on or after the 31st" do
      calendar = Calendar.new
      calendar.end_date(Date.new(2012,3,10)).should eql(Date.new(2012,3,31))
    end
  end

  describe "month_header" do 
    it "should render the month name" do
      calendar = Calendar.new
      calendar.month_header(DateTime.new(2012,3,31)).should eql("<h2><March 2012></h2>")
    end
  end

  describe "day_header" do 
  end

  describe "body" do 
  end

  describe "day" do 
  end

  describe "day_events" do
    before(:each) do
      @events = [Event.new("title", DateTime.new(2012,3,18)), 
                 Event.new("title2", DateTime.new(2012,3,22))]
      @calendar = Calendar.new
    end
    it "should select events with specific date" do
      @calendar.day_events(Date.new(2012,3,18), @events).should eql([@events[0]])
    end

    it "should not select events without specific date" do
      @calendar.day_events(Date.new(2012,4,18), @events).should eql([])
    end
  end 

end 