require "test_helper"

feature 'Creating a project' do
  scenario 'should let users create a project' do
    sign_in
    visit new_project_path
    fill_in 'Title', with: 'Test Project'
    fill_in 'Body', with: 'Test Body'
    click_on 'Create Project'
    page.text.must_include 'successfully created'
  end
end

feature 'Viewing projects' do
  scenario 'should let users view projects' do
    sign_in
    visit projects_path
    page.text.must_include projects(:project_1).title
  end
end
