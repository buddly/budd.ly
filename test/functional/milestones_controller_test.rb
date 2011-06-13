require 'test_helper'

class MilestonesControllerTest < ActionController::TestCase
  
  setup do
    @user = Factory(:user)
    sign_in @user
    @goal = Factory(:goal, :creator => @user)
    @milestone = Factory(:milestone, :goal => @goal)
  end

  test "should get index" do
    get :index, :goal_id => @goal.to_param
    assert_response :success
    assert_not_nil assigns(:milestones)
  end

  test "should get new" do
    get :new, :goal_id => @goal.to_param
    assert_response :success
  end

  test "should create milestone" do
    assert_difference('@goal.milestones.count') do
      post :create, :goal_id => @goal.to_param, :milestone => Factory.attributes_for(:milestone).reject{|k,v| k.to_s == 'goal_id'}
    end

    assert_equal @goal, assigns(:milestone).goal
    assert_redirected_to goal_milestone_path(@goal, assigns(:milestone))
  end

  test "should create milestone via ajax" do
    assert_difference('@goal.milestones.count') do
      xhr :post, :create, :goal_id => @goal.to_param, :milestone => Factory.attributes_for(:milestone, :goal_id => nil).reject{|k,v| k.to_s == 'goal_id'}
    end

    assert_equal @goal, assigns(:milestone).goal
    assert_match %r{Buddly.close_overlay}, @response.body
  end

  test "should show milestone" do
    get :show, :goal_id => @goal.to_param, :id => @milestone.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :goal_id => @goal.to_param, :id => @milestone.to_param
    assert_response :success
  end

  test "should update milestone" do
    put :update, :goal_id => @goal.to_param, :id => @milestone.to_param, :milestone => @milestone.attributes
    assert_redirected_to goal_milestone_path(@goal, assigns(:milestone))
  end

  test "should destroy milestone" do
    assert_difference('Milestone.count', -1) do
      delete :destroy, :goal_id => @goal.to_param, :id => @milestone.to_param
    end

    assert_redirected_to goal_milestones_path(@goal)
  end
end
