require 'test_helper'

class ProgrammersControllerTest < ActionController::TestCase
  setup do
    @programmer_one = programmers(:john)
    @programmer_two = programmers(:jane)
  end

    test "should get new" do
      get :new
      assert_response :success
      assert_not_nil assigns(:programmer)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:programmers)
    end

    test "should create programmer" do
      assert_difference('Programmer.count') do
        post :create, programmer: { first_name: "Test", last_name: "Me",
           email: "testme@example.com", password: "password"}
      end

      assert_not_nil assigns(:programmer)
      assert_redirected_to programmers_path
    end

end
