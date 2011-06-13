require 'test_helper'

class GoalsControllerTest < ActionController::TestCase
  setup do
    @user = Factory(:user)
    sign_in @user
    @goal = Factory(:goal, :creator => @user)
  end

  test 'should only show own goals on index' do
    fail
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:goals)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create goal' do
    assert_difference('Goal.count') do
      post :create, :goal => Factory.attributes_for(:goal, :creator => nil)
    end

    assert_equal @user, assigns(:goal).creator
    assert_redirected_to goal_path(assigns(:goal))
  end

  test 'should show goal' do
    get :show, :id => @goal.to_param
    assert_response :success
  end
  
  test 'should not show private goal from other user' do
    fail
  end

  test 'should get edit' do
    get :edit, :id => @goal.to_param
    assert_response :success
  end

  test 'should update goal' do
    put :update, :id => @goal.to_param, :goal => @goal.attributes
    assert_redirected_to goal_path(assigns(:goal))
  end

  test 'should destroy goal' do
    assert_difference('Goal.count', -1) do
      delete :destroy, :id => @goal.to_param
    end

    assert_redirected_to goals_path
  end
end
