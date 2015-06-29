require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @programmer = Programmer.create(first_name: "First", last_name:
        "Last", email: "firstlast@example.com", password: "seekrit")
  end

  test "shoud get new" do
    get :new
    assert_response :success
  end

  test "should post new" do
    post :new
    assert_response :success
  end
#Try this with password validation is a nightmare
#  test "should set session[user_id] to programmer id" do
#    get :new
#    post :new, session: { email: @programmer.email,
#        password: @programmer.password }
#    assert_equal @programmer.id, session[:user_id]
#  end

  test "should delete session" do
    session[:user_id] = 4
    get :destroy
    assert_equal nil, session[:user_id]
  end

  test "session should not be set when password is wrong" do
    get :new
    post :new, session: { email: @programmer.email,
        password: 'Yippy!!!!' }
    assert_equal nil, session[:user_id]
  end

  test "session should not be set when email does not exist" do
    get :new
    post :new, session: { email: "TheCakeIsAlie@portal.com",
        password: @programmer.id }
    assert_equal nil, session[:user_id]
  end
end
