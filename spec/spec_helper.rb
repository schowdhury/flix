require 'rubygems'
require 'rspec'
require 'rspec/mocks'
require 'rspec/expectations'


PROJECT_ROOT=File.join(File.dirname(__FILE__), '../')

Dir[File.join(PROJECT_ROOT, "models/**/*.rb")].each {|f| require f }

RSpec.configure do |config|
  # some (optional) config here
  config.mock_with :rspec
  config.formatter = :documentation
  config.color_enabled = true  
end

