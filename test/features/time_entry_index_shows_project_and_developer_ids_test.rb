require "test_helper"
setup do
  @programmer = Programmer.create(first_name: "First", last_name:
      "Last", email: "firstlast@example.com", password: "seekrit")
end
class TimeEntryIndexShowsProjectAndDeveloperIdsTest < Capybara::Rails::TestCase
  test "can create a new time entry and dev id and proj id will show" do
    visit '/signin'
    fill_in('Email', with: @programmer.email)
    fill_in('Password', with: 'seekrit')
    click_button('Sign In')
    visit time_entries_new_path
    fill_in('Duration in Hours', with: 5)
    fill_in('Date Time was Spent', with: 06/26/2015)
    fill_in('Project Id', with: 1)
    click_button('Create Time entry')
    visit time_entries_path
    assert_equal 'Project', tr.first('td')[2].text
    assert_equal 'Programmer', tr.first('td')[3].text
    page.all('#row-body tr').each do |tr|
      assert_equal '1', tr.last('td')[2].text
      assert_equal @developer.full_name, tr.last('td')[3].text
    end
  end
end
