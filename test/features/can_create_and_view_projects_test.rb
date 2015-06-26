require "test_helper"

class CanCreateAndViewProjectsTest < Capybara::Rails::TestCase
  test "new and index views render" do
    visit projects_new_path
    assert_content page, 'Add a New Project'

    visit projects_path
    assert_content page, "Project List!"
  end

  test " new lets you create projects by entering names and time limits
  end
end
