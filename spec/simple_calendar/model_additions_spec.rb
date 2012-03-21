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
    pending
  end
end 