ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  require 'capybara/rails'
  require "rack_session_access/capybara"
  include Capybara::DSL
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

  # Add more helper methods to be used by all tests here...
  def assert_presence(model, field)
    model.valid?
    assert_match /can't be blank/, model.errors[field].join, "Presence error for #{field} not found on #{model.class}"
  end

  def sign_up_as(name, email)
    visit root_url
    click_link "sign-up"
    fill_in "user_name", with: name
    fill_in "user_email", with: email
    fill_in "user_password", with: "12341234"
    fill_in "user_password_confirmation", with: "12341234"
    click_button "Sign up"
  end

end

