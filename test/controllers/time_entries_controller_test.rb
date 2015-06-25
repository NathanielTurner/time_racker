require 'test_helper'

class TimeEntryControllerTest < ActionController::TestCase
  setup do
    @time_entry = time_entries(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
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

    assert_redirected_to time_entries_path(assigns(:time_entry))
  end

  test "should show time_entry" do
    get :show, id: @time_entry
    assert_response :success
  end
  
end
