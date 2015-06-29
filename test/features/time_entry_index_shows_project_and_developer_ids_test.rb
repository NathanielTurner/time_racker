require "test_helper"
include FeatureHelper
class TimeEntryIndexShowsProjectAndprogrammerIdsTest < Capybara::Rails::TestCase

  setup do
    @programmer = FeatureHelper.set_programmer
    @project = FeatureHelper.set_project
  end

  test "can create a new time entry and dev id and proj id will show" do
    visit '/signin'
    fill_in('Email', with: @programmer.email)
    fill_in('Password', with: 'seekrit')
    click_button('Sign In')
    visit projects_path
    within_row(@project.name) do
      click_link 'Add Time Entry'
    end
    fill_in('Duration in Hours', with: 5)
    fill_in('Date Time was Spent', with: "06/26/2015")
    click_button('Create Time entry')
    visit time_entries_path
    header = page.find('#row-header')
    assert_content header, 'Project'
    entries = page.all('#row-body')
    assert_content 'Programmer'
    entries.last do |row|
      datas = row.all('td')
      assert_content datas[2], 'Build Skynet'
      assert_content datas[3], @programmer.full_name
    end
  end
end
