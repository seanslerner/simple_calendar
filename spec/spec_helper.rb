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

  def content_tag name, content_or_options_with_block = nil, options = nil, escape = true, &block
    html_string = ""
    html_string << "<#{name.to_s}>"
    html_string << block.call if block_given?
    html_string << "</#{name.to_s}>"
    html_string
  end

  def calendar_path args 
  end
  def link_to text, path
    "#{text}"
  end
  def concat string 
    string
  end
end