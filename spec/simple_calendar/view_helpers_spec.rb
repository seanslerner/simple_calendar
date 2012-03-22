require 'spec_helper.rb'

describe SimpleCalendar::ViewHelpers do
  before :each do
    @calendar = Calendar.new
    @events = [Event.new("title", DateTime.new(2012,3,18)), 
                 Event.new("title2", DateTime.new(2012,3,22))]
  end
  describe "calendar" do
    it "should make an html calendar" do
      # @events = [Event.new("title", DateTime.new(2012,3,18)), 
      #            Event.new("title2", DateTime.new(2012,3,22))]
      # @calendar = Calendar.new
      # puts @calendar.calendar @events do |evnt|
      #   evnt.title
      # end
      pending "Params in day variable are causing problems"
    end
  end

  describe "start_date" do
    it "should return the first sunday on or before the 1st" do
      @calendar.start_date(Date.new(2012,3,10)).should eql(Date.new(2012,2,26))
    end
  end

  describe "end_date" do
    it "should return the last saturday on or after the 31st" do
      @calendar.end_date(Date.new(2012,3,10)).should eql(Date.new(2012,3,31))
    end
  end

  describe "month_header" do 
    it "should render the month name" do
      @calendar.month_header(DateTime.new(2012,3,31)).should eql("<h2><March 2012></h2>")
    end
  end

  describe "day_header" do 
    it "should render the days of the week" do
      pending "trouble with I18n"
    end
  end

  describe "body" do
    before(:each) do 
      @blck = Proc.new do |evnt|
        evnt.title
      end
      @cal_string = @calendar.body(Date.new(2012,3,18), @events, @blck)
    end
    it "should start and end with tbody tags" do
      @cal_string.should include("<tbody>")
      @cal_string.should include("</tbody>")
    end
    it "should include 7 td tags each week" do
      7.times do
        @cal_string.should match(/\<td\>\<\/td\>/)
        @cal_string = @cal_string[@cal_string.index(/\<td\>\<\/td\>/)+9..-1]
      end
    end
    it "should include a tr tags for each week (5 in total)" do
      5.times do
        @cal_string.should match(/\<tr\>/)
        @cal_string = @cal_string[@cal_string.index(/\<tr\>/)+4..-1]
      end
    end
  end

  describe "day" do 
    it "should render html for each day" do
      blck = Proc.new do |evnt|
        evnt.title
      end
      @calendar.day(Date.new(2012,3,18), @events, blck).should eql("<td>#{@events[0].title}</td>")
    end
  end

  describe "day_events" do
    it "should select events with specific date" do
      @calendar.day_events(Date.new(2012,3,18), @events).should eql([@events[0]])
    end
    it "should not select events without specific date" do
      @calendar.day_events(Date.new(2012,4,18), @events).should eql([])
    end
  end 
end 