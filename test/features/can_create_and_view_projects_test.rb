require "test_helper"

class CanCreateAndViewProjectsTest < Capybara::Rails::TestCase
  test "new and index views render" do
    visit projects_new_path
    assert_content page, 'Add a New Project'

    visit projects_path
    assert_content page, "Project List!"
  end

  test "index page lists projects with names and time_limits" do
    visit projects_path
    assert page.has_css?('th', count: 2)
    assert page.has_css?('tr', count: 3)
    assert page.has_css?('#project-name', count: 2)
    assert page.has_css?('#time-limit', count: 2)
  end

  test "form can be filled out and submited to create new project" do
    visit time_entries_new_path
    assert page.find('input[type="text"][name="project[name]"]')
    assert page.find('input[type="number"][name="project[time_limit]"]')

    assert_difference('TimeEntry.count') do
      fill_in('Project Name', with: 10)
      fill_in('Max Allowed Production Hours', with: '03/03/3030')
      click_button('Create Time entry')
    end
  end

end
