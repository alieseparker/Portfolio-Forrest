require 'test_helper'

feature 'Deleting an Article'  do
  scenario 'article is deleted with a click' do
    sign_in(:Peach)
    article = Article.create(title: 'Becoming a Code Fellow',
                             body: 'Means striving for excellence')
    visit articles_path(article)
    page.find('tbody tr:last').click_on 'Destroy'
    page.wont_have_content 'Becoming a Code Fellow'
  end

  scenario('as an author I should not be able to delete articles so that
    I can give the editor publishing control') do
    sign_in(:Daisy)
    article = Article.create(title: 'Becoming a Code Fellow',
                             body: 'Means striving for excellence')
    visit articles_path(article)
    page.wont_have_content 'Destroy'
  end
end
