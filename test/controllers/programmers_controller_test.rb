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

    test "index page shows all programmers" do
      get :index
# i Count the instance variable amount so that the test will still pass
# if the instance variable value is selected on, for example, by a
# foreign id.
# They are depricating the assigns in rails five, a shame I found it can be
# quite usefull
      amount = assigns["programmers"].count
      assert_select "tbody" do
        assert_select("tr",amount)
      end
    end

end
