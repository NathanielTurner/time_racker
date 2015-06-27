Heroku Link https://time-tracker-skill-improvement.herokuapp.com

## Minitest with Capybara

Capybara is a testing add-on that enables simplified test writing.

#### To use Capybara with Rails, the following links will be helpful.
* Documentation for Module: Capybara - http://www.rubydoc.info/github/jnicklas/capybara/Capybara

* Github documentation for capybara minitest version -
https://github.com/blowmage/minitest-rails-capybara

* Capybara cheat sheet - https://gist.github.com/zhengjia/428105

#### Installation
I will guide you through the steps here, which may be more helpful than the steps documented on the Github link I provided.

##### Install the gem
* add this gem to your gem file under group production test - gem 'gem 'minitest-rails-capybara' than bundle install

Once done Rails needs to be configured to use capybara.
These steps can be done in your lib/tasks files but I found it far less confusing to do it in the Rakefile.
* Open your Rakefile, and below

##### Rails.application.load_tasks,
place these two blocks of code

```ruby
Rails::TestTask.new("test:features" => "test:prepare") do |t|
  t.pattern = "test/features/**/*_test.rb"
end
```
This adds the ability for the folder ./test/features to be utilized by rails testing machinery.

```ruby
Rake::Task["test:run"].enhance ["test:features"]
```

This allows the tests in the features folder to be run alongside all other tests when rake command is used.

#### Thats it, rails is setup to use capybara.

## Using Capybara.

In the first block of code above I mentioned something about ./test/features. You currently may know about test folders for controllers, models, and integration. Features are a new level of testing enabled by capybara that adds a fourth test layers.
If you look at all the test folders you may find that
* Controller are meant to test that controller actions function correctly
* Model tests are meant to check that states and methods in models such as associations and functions, work correctly.
* Integration tests essentially pretend to be a user browsing the app, and test that it functions as expected.
* Feature tests essentially do the same thing, but on a much smaller scale.

When designing an app, best practice is to do it in many small pieces, or features, if you want to call them that. When designing a feature you can build one feature test that emulates all that you wish to happen for that specific feature.

 Unlike an integration test, these tests can be small, and numerous. For example, you would only have One controller test per controller, linked to that controller. A feature test is linked to nothing, and can test whatever you wish it to.

## Build a Feature Test

There no need to manually add a new features folder, or test file.
This command will do it for you.

```bash
rails generate minitest:feature CanCreateNewFeature
```
This will produce a feature folder with a feature test inside with this generic code.

```ruby
require "test_helper"

class ProgrammersCanLogInAndOutTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    assert_content page, "Hello World"
    refute_content page, "Goobye All!"
  end
end
```

From here you can visit any desired path, use any functions available to minitest, such as assert, or use what makes capybara so amazing, its natural languagish commands. With these, its as if your talking to the test and telling it, well essentially click this, fill in that, as you would a normal person.

For example, say you want to build a form page so someone can create an account. Building this into your feature test will test that the user can do just that.

```ruby
require "test_helper"

class UsersCanSignupSigninAndLogoutTest < Capybara::Rails::TestCase
  test "New users can be created" do
    visit programmers_new_path
    assert_difference('Programmer.count') do
      fill_in('First Name', with: 'FIRSTNAME')
      fill_in('Last Name', with: 'LASTNAME')
      fill_in('Email Address', with: 'firstlast@example.com')
      fill_in('Password', with: 'Seekrit')
      fill_in('Confirm Your Password', with: 'Seekrit')
      click_button('Create Programmer')
    end
  end
end
```

There is a nifty thing about this test. Notice the 'First Name' after fill_in? This is text that is rendered on the page next to the input boxes. It doesn't even need to find the fill-in box by label, or id, or anything else to fill in data for that input box.

This is simply a test the form can be filled in. Feature tests are not limited to this. You can use both capybara and minitest to test just about anything about a visited page. For instance
```ruby
assert page.find('input[type="text"][name="programmer[first_name]"]')
```
will assert a given input box exists

```ruby
assert page.has_css?('tr', count: 3)
```
will assert the rendered page must have only three table rows rendered.

```ruby
assert page.has_css?('#name', count: 2)
```
will assert only two elements with id='name' have been rendered.

This will give you the power to virtually dictate through the test exactly how a page should look when rendered. You could get crazy define every last minute detail if you wanted to harass your front-end crew.

## Thats all I have for now. I hope this helps
##### P.S You can use this application for reference on TDD using capybara. There is a file name Development_diary.md that gives the rundown on the development process.
