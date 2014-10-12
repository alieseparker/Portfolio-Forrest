ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest'
require 'minitest/rails'
require 'minitest/rails/capybara'

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Capybara::DSL
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all

  def sign_in(test_user = :Peach)
    visit new_user_session_path
    fill_in 'Email', with: users(test_user).email
    fill_in 'Password', with: 'password'
    click_on 'Log in'
  end
end
