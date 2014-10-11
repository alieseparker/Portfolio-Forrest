require 'test_helper'

feature 'CheckForZurb' do
  scenario 'zurb should be loaded in the stylesheets' do
    visit root_path
    page.has_css? 'columns'
  end
end
