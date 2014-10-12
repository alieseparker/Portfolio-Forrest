require 'test_helper'

feature 'Creating an Article Test' do
  scenario 'submit form data to create a new article' do
    sign_in
    visit new_article_path
    fill_in 'Title', with: 'Code Rails'
    fill_in 'Body', with: 'This is how I learned to make web apps.'

    click_on 'Create Article'

    page.text.must_include 'Article was successfully created'
    page.text.must_include 'how I learned to make web apps'

    page.has_css?('#author').must_equal true
  end
end
