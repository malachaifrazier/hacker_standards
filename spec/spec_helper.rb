require 'rubygems'
require 'spork'
#require 'spork/ext/ruby-debug'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
  end

  include ActionController::RecordIdentifier 
end

Spork.each_run do

end