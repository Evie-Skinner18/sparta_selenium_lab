require 'selenium-webdriver'
require_relative '../lib/ui_testing_lab'
require_relative '../generator/random_generator'

RSpec.configure do |config|
  config.formatter = :documentation
end
