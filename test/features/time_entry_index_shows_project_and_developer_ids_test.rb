require "test_helper"

class TimeEntryIndexShowsProjectAndprogrammerIdsTest < Capybara::Rails::TestCase
  setup do
    @programmer = Programmer.create(first_name: "First", last_name:
        "Last", email: "firstlast@example.com", password: "seekrit")
    @project = Project.create(name: 'Make Skynet', time_limit: 3000)
  end

  test "can create a new time entry and dev id and proj id will show" do
    visit '/signin'
    fill_in('Email', with: @programmer.email)
    fill_in('Password', with: 'seekrit')
    click_button('Sign In')
    visit time_entries_new_path
    fill_in('Duration in Hours', with: 5)
    fill_in('Date Time was Spent', with: 06/26/2015)
    fill_in('Project Id', with: @project.id)
    click_button('Create Time entry')
    visit time_entries_path
    assert_content page, 'Project'
    assert_content page, 'Programmer'
    page.all('#row-body tr').each do |tr|
      assert_equal page, 'read stuff'
      assert_equal page, @programmer.full_name 
    end
  end
end
