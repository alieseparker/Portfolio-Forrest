require "test_helper"

feature "Visiting the Article Index" do
  scenario "with existing articles, show list" do
    visit articles_path
    page.must_have_content "Listing Articles"
    page.wont_have_content "Goobye All!"
  end
end
