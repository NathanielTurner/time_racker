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
    delete destroy:
    assert_response :success
    assert_equal nil, session[user_id]
  end

#  test "create should validate programmer"
#  post create:
#    before(:each) do
#      @ attr = { :email => "johndoe@example.com", :password => "secret" }
#      Programmer.should_receive(:authenticate).
#           with(@attr[:email], @attr[:password]).
#           and_return(nil)
#    end
#  end
end
