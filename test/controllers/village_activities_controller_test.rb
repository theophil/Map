require 'test_helper'

class VillageActivitiesControllerTest < ActionController::TestCase
  setup do
    @village_activity = village_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:village_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create village_activity" do
    assert_difference('VillageActivity.count') do
      post :create, village_activity: { active: @village_activity.active, activity_id: @village_activity.activity_id, end_date: @village_activity.end_date, name: @village_activity.name, start_date: @village_activity.start_date, village_id: @village_activity.village_id }
    end

    assert_redirected_to village_activity_path(assigns(:village_activity))
  end

  test "should show village_activity" do
    get :show, id: @village_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @village_activity
    assert_response :success
  end

  test "should update village_activity" do
    patch :update, id: @village_activity, village_activity: { active: @village_activity.active, activity_id: @village_activity.activity_id, end_date: @village_activity.end_date, name: @village_activity.name, start_date: @village_activity.start_date, village_id: @village_activity.village_id }
    assert_redirected_to village_activity_path(assigns(:village_activity))
  end

  test "should destroy village_activity" do
    assert_difference('VillageActivity.count', -1) do
      delete :destroy, id: @village_activity
    end

    assert_redirected_to village_activities_path
  end
end
