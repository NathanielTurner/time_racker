require "test_helper"

class CanCreateTimeEntriesTest < Capybara::Rails::TestCase
  test "new form renders" do
    visit time_entries_new_path
    assert_content page, 'Record a Time Entry'
  end

  test "form has fields for duration and date" do
    visit time_entries_new_path
    assert page.find('input[type="number"][name*="duration"]')
  #  assert page.find('input[type="date"]')
    assert page.find('input[type="date"][name*="date"]')
  end
end
