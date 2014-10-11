require 'test_helper'

feature('As the site owner, I want to edit a project so that I can
  correct typos') do |_variable|
  scenario 'editing an existing project' do
    visit edit_project_path(projects(:project_1))
    fill_in 'Name', with: 'My Rad Portfolio'
    click_on 'Update Project'
    page.text.must_include 'Project was successfully updated.'
    page.text.must_include 'Rad Portfolio'
    page.text.wont_include 'Code Fellows Portfolio'
  end

  scenario 'incorrectly editing an existing project' do
    visit edit_project_path(projects(:project_1))
    fill_in 'Name', with: 'Err'
    click_on 'Update Project'
    page.text.must_include 'prohibited'
    page.text.must_include 'Name is too short'
  end
end
