require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

    test "should get new" do
      get :new
      assert_response :success
      assert_not_nil assigns(:project)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:projects)
    end

    test "should create project" do
      assert_difference('Project.count') do
        post :create, project: { name: "Koans", time_limit: 3000}
      end
      assert_not_nil assigns(:project)
      assert_redirected_to projects_path
    end
end
