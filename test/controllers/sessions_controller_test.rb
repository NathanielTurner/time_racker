require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @programmer_one = programmers(:john)
    @programmer_two = programmers(:jane)
  end

  test "shoud get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:title)
  end

  test "should post create" do
    post :create
    assert_response :success
  end


  test "should set session[user_id] to programmer id" do
    post :create, session: { email: @programmer_one.email,
        password: @programmer_one.password }
    assert_equal @programmer_one.id, session[user_id]
  end

  test "should delete session" do
    delete :destroy
    assert_response :success
    assert_equal nil, session[user_id]
  end

  test "session should not be set when password is wrong" do
    delete :destroy
    post :create, session: { email: @programmer_one.email,
        password: 'Yippy!!!!' }
    assert_equal nil, session[user_id]
  end

  test "session should not be set when email does not exist" do
    delete :destroy
    post :create, session: { email: "TheCakeIsAlie@portal.com",
        password: @programmer_one.id }
    assert_equal nil, session[user_id]
  end
end
