ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
  teardown :clean_mongodb
  def clean_mongodb
    Mongoid.default_session.collections.select {|c| c.name !~ /system/ }.each(&:drop)
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
end
