require "test_helper"

class CanCreateTimeEntriesTest < Capybara::Rails::TestCase
  test "new and index pages render" do
    visit time_entries_new_path
    assert_content page, 'Record a Time Entry'
    visit time_entries_path
    assert_content page, 'All Time Entries'
  end

  test "form has fields for duration and date" do
    visit time_entries_new_path
    assert page.find('input[type="number"][name*="duration"]')
    assert page.find('input[type="date"][name*="date"]')
  end

  test "index page list time entries and thier durations and dates" do
    visit time_entries_path
    assert page.has_css?('tr', :count => 3)
    assert page.has_css?('#duration', :count => 2)
    assert page.has_css?('#date', :count => 2)
  end
end
