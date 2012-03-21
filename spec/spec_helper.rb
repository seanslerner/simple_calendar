$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rubygems'
require 'simple_calendar'
require 'date'
require 'active_support/all'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end

class Event 
  attr_accessor :title, :start_time_column
  def initialize title, start
    @title = title
    @start_time_column = start
  end
end

class Calendar
  include SimpleCalendar::ViewHelpers
end