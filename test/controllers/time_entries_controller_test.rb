require 'test_helper'

class TimeEntriesControllerTest < ActionController::TestCase
  setup do
    @time_entry = time_entries(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:time_entry)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_entries)
  end

  test "should create time_entry" do
    assert_difference('TimeEntry.count') do
      post :create, time_entry: { duration: 1000}
    end

    assert_not_nil assigns(:time_entry)
    assert_redirected_to projects_path
  end

  test "should be able to create time_entry with dev and proj ids" do
    assert_difference('TimeEntry.count') do
      post :create, time_entry: { duration: 1000, developer_id: 1,
          project_id: 1 }
    end
  end

end
