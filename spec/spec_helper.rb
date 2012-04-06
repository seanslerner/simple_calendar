require 'simplecov_custom_adapter'
SimpleCov.start 'gem'

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

class ActiveRecord
  class Base
    extend SimpleCalendar::ModelAdditions
  end
end

class Event 
  attr_accessor :title, :start_time_column
  def initialize title, start
    @title = title
    @start_time_column = start
  end
end

class Calendar < ActiveRecord::Base
  include SimpleCalendar::ViewHelpers
  #include ActiveSupport::Configurable
  #might help with config in ModelAdditions?

  def content_tag name, options = nil, escape = true, &block
    opt = if options.class == Hash 
      options.each {|k, v| "#{k}=\"#{v}\""} if options
    elsif options.class == Fixnum
      options
    else
      nil
    end
    html_string = ""
    html_string << "<#{name.to_s}#{ opt if opt}>"
    html_string << block.call if block_given?
    html_string << "</#{name.to_s}>"
    html_string
  end

  def calendar_path args 
  end
  def link_to text, path
    "#{text}"
  end
  def request
    " "
  end
  def concat string 
    string
  end
end
class String
  def fullpath
    ' '
  end
end