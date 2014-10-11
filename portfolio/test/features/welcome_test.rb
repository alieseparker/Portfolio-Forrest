require "test_helper"

feature 'As a site visitor, when visiting the root url' do
  scenario 'I wish to see a welcome page' do
    visit root_url
    page.must_have_content "Welcome"
  end
end