require "test_helper"

class ProgrammersCanLogInAndOutTest < Capybara::Rails::TestCase
  test "signin page renders" do
    visit sessions_new_path
    assert_content page, 'Sign In'
  end

  test "form has fields for email and password" do
    visit time_entries_new_path
    assert page.find('input[type="text"][name="session[email]"]')
    assert page.find('input[type="password"][name="session[password]"]')
  end

end
