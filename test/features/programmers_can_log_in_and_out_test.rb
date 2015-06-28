require "test_helper"

class ProgrammersCanLogInAndOutTest < Capybara::Rails::TestCase
  test "signin page renders" do
    visit sessions_new_path
    assert_content page, 'Sign In'
  end
end
