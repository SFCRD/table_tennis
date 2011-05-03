ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  def assert_error_on(field, model)
    assert model.errors[field.to_sym].present?, "No validation error on the #{field.to_s} field."
  end

  def assert_no_error_on(field, model)
    assert model.errors[field.to_sym].nil?, "Validation error on #{field.to_s}."
  end
end
