require "test_helper"

class ProgrammersCanLogInAndOutTest < Capybara::Rails::TestCase
  setup do
    @programmer_one = programmers(:john)
    @programmer_two = programmers(:jane)
  end

  test "signin page renders" do
    visit sessions_new_path
    assert_content page, 'Sign In'
  end

  test "form has fields for email and password" do
    visit time_entries_new_path
    assert page.find('input[type="text"][name="session[email]"]')
    assert page.find('input[type="password"][name="session[password]"]')
  end

  test "programmer can fill in form than be logged in" do
    visit sessions_new_path
    fill_in('Email', with: @programmer_one.email)
    fill_in('Password', with: @programmer_one.password)
    click_button('Create session')
  end
end
