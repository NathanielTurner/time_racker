require "test_helper"

class CanCreateAndViewProgrammersTest < Capybara::Rails::TestCase
  test "new and index programmer pages render" do
    visit programmers_new_path
    assert_content page, 'Sign-up a New Programmer'

    visit programmers_path
    assert_content page, 'List of All Programmers'
  end

  test "new form has fields for first/last name, email, and password" do
    visit programmers_new_path
    assert page.find('input[type="text"][name="programmer[first_name]"]')
    assert page.find('input[type="text"][name="programmer[last_name]"]')
    assert page.find('input[type="text"][name="programmer[email]"]')
    assert page.find('input[type="password"][name="programmer[password]"]')
    assert page.find('input[type="password"][name="programmer[password_confirmation]"]')
  end

  test "index page lists programmer names and creation dates" do
    visit programmers_path
    assert page.has_css?('tr', count: 3)
    assert page.has_css?('#first', count: 2)
    assert page.has_css?('#last', count: 2)
    assert page.has_css?('#join_date', count: 2)
  end
#how cool is this. it can find the input simply but what text is
#rendered next to it. I really like this. Its so much more simple
#to read IMO than a similar test without capybara.
  test "new programmers can be created" do
    assert_difference('Programmer.count') do
      visit programmers_new_path
      fill_in('First Name', with: 'first')
      fill_in('Last Name', with: 'last')
      fill_in('Email Address', with: 'firstlast@example.com')
      fill_in('Password', with: 'Seekrit')
      fill_in('Confirm Your Password', with: 'Seekrit')
      click_button('Create Programmer')
    end
  end

end
