require 'test_helper'

feature 'Deleting a Project'  do
  scenario 'Project is deleted with a click' do
    visit project_path(projects(:project_1).id)
    click_on 'Destroy'
    page.text.must_include 'Project was successfully deleted.'
    page.wont_have_content 'Code Fellows Portfolio'
  end
end
