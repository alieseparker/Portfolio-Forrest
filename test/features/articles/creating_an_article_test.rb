require 'test_helper'

feature 'Creating an article' do
  scenario 'submit form data to create a new article' do
    # Given a completed new article form
    sign_in(:Daisy)
    visit new_article_path
    fill_in 'Title', with: 'Code Rails'
    fill_in 'Body', with: 'This is how I learned to make web apps.'
    click_on 'Create Article'
    page.text.must_include 'Article was successfully created'
    page.text.must_include 'how I learned to make web apps'

    page.has_css?('#author').must_equal true
    page.text.must_include users(:Daisy).email
    page.text.must_include 'Status: Unpublished'
  end

  scenario 'unauthenticated site visitors cannot visit new_article_path' do
    visit new_article_path
    page.must_have_content 'You need to sign in or sign up before continuing'
  end

  scenario 'unauthenticated site visitors cannot see new article button' do
    visit articles_path
    page.wont_have_link 'New Article'
  end

  scenario "authors can't publish" do
    sign_in(:Daisy)
    visit new_article_path
    page.wont_have_field('Published')
  end

  scenario 'editors can publish' do
    sign_in(:Peach)
    visit new_article_path
    page.must_have_field('Published')
    fill_in 'Title', with: articles(:article_1).title
    fill_in 'Body', with: articles(:article_1).body
    check 'Published'
    click_on 'Create Article'
    page.text.must_include 'Status: Published'
  end
end
