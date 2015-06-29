require "test_helper"

class ProgrammersCanLogInAndOutTest < Capybara::Rails::TestCase
  setup do
    @programmer = Programmer.create(first_name: "First", last_name:
        "Last", email: "firstlast@example.com", password: "seekrit")
  end

  test "signin page renders" do
    visit '/signin'
    assert_content page, 'Sign In'
  end

  test "form has fields for email and password" do
    visit '/signin'
    assert page.find('input[type="text"][name="session[email]"]')
    assert page.find('input[type="password"][name="session[password]"]')
  end

  test "programmer can fill in form than be logged in" do
    visit '/signin'
    fill_in('Email', with: @programmer.email)
    fill_in('Password', with: 'seekrit')
    click_button('Sign In')
# theres no access to the session here. Ile have to figure something out
#    assert_equal @programmer.id, session[:user_id]
    assert_content page, 'Project List'
    visit signout_path
  end

  test "after login, button shows that logs user out universally" do
    visit '/signin'
    fill_in('Email', with: @programmer.email)
    fill_in('Password', with: 'seekrit')
    click_button('Sign In')
# theres no access to the session here. Ile have to figure something out
#    assert_equal @programmer.id, session[:user_id]
    click_link('Sign Out')
    assert_content page, 'Sign In'
  end
end
