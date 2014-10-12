require 'test_helper'

feature("
  As a site visitor, I want to be able to sign out of my account,
  so that I can know my account can't be changed.
  ") do
  scenario 'sign up' do
    visit 'users/sign_in'
    fill_in 'Email', with: 'peach@you.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
    page.must_have_content 'Signed in successfully'
    page.wont_have_content 'There was a problem with your sign up'
    click_on 'Sign Out'
    page.must_have_content 'Signed out successfully'
  end
end
