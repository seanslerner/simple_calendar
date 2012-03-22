require 'spec_helper.rb'

describe SimpleCalendar::ModelAdditions do
  it "should add the has_calendar class method" do
    Calendar.should respond_to :has_calendar
  end 
  it "should not add a has_calendar instance method" do
    calendar = Calendar.new
    calendar.should_not respond_to :has_calendar
  end
  it "should update the :start_time config" do
    #Calendar.has_calendar({:start_time => :my_start_time})
    pending "Need to figure out how config works"
  end
  it "should set :start_time to start_time by default" do
    pending "Need to figure out config"
  end
  it "should do something with :start_time_column method" do
    pending
  end
end 