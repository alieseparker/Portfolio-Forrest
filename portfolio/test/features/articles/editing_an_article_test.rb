require 'test_helper'

feature 'Editing an Article' do
  scenario 'submit updates to an existing article' do
    article = Article.create(title: 'Becoming a Code Fellow',
                             body: 'Means striving for excellence.')
    visit article_path(article)

    click_on 'Edit'
    fill_in 'Title', with: 'Becoming a Web Developer'
    click_on 'Update Article'

    page.text.must_include 'Article was successfully updated'
    page.text.must_include 'Web Developer'
  end
end
