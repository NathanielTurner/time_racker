require "test_helper"

class ProgrammersCanLogInAndOutTest < Capybara::Rails::TestCase
  setup do
    @programmer_one = programmers(:john)
    @programmer_two = programmers(:jane)
  end

  test "signin page renders" do
    visit signin_path
    assert_content page, 'Sign In'
  end

  test "form has fields for email and password" do
    visit signin_path
    assert page.find('input[type="text"][name="session[email]"]')
    assert page.find('input[type="password"][name="session[password]"]')
  end

  test "programmer can fill in form than be logged in" do
    visit signin_path
    fill_in('Email', with: @programmer_one.email)
    fill_in('Password', with: @programmer_one.password)
    click_button('Create session')
    assert_equal @programmer_one.id, session[user_id]
    assert_redirected_to projects_path
    visit signout_path
  end

  test "after login, button shows that logs user out universally" do
    visit signin_path
    fill_in('Email', with: @programmer_two.email)
    fill_in('Password', with: @programmer_two.password)
    click_button('Create session')
    assert_equal @programmer_two.id, session[user_id]
    click_button('Log Out')
    assert_redirected_to signin_path
  end
end
