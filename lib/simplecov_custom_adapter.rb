require 'simplecov'

SimpleCov.adapters.define 'gem' do
  add_filter '/spec/'

  add_group 'Libraries', '/lib/'
end