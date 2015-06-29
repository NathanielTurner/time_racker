require "test_helper"
include FeatureHelper
class ProjectIndexRowsHaveAddTimeEntryButtonsTest < Capybara::Rails::TestCase
  setup do
    @programmer = FeatureHelper.set_programmer
    @project = FeatureHelper.set_project
  end

  test "index page has link that redirects to time_entries_new" do
    visit projects_path
    assert page.has_link?('Add Time Entry')
    assert page.has_css?('#enter-time', count: 3)
    links = page.all("a", :text => 'Add Time Entry')
    links.last do |link|
      click_link(link)
    end
    assert_content page, 'Record a Time Entry'
  end

  test "can set time and date only and have dev and proj id set" do
    visit signin_path
    fill_in('Email', with: @programmer.email)
    fill_in('Password', with: 'seekrit')
    click_button('Sign In')
    assert_content page, 'Logged in Successfully'
    assert_content page, "Logged in as: #{@programmer.full_name}"
    visit projects_path
    links = page.all("a", :text => 'Add Time Entry')
    links.last do |link|
      click_link(link)
    end
    assert_content page, 'Record a Time Entry'
    fill_in('Duration in Hours', with: 3)
    full_in('Date Time was Spent', with: '01/10/1010')
    click_button('Create Time entry')
    assert_content page, 'Time entry was successfully recorded.'
    visit time_entries_path
    header = page.find('#row-header')
    header_data = header.all('td')
    assert_content header_data[2], 'Project'
    assert_content header_data[3], 'Programmer'
    body = page.all('#row-body').last
    body_data = body.all('td')
    assert_content body_data[2], 'Build Skynet'
    assert_content body_data[3], @programmer.full_name
    end
  end
end
