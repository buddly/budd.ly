class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def get_goal
    param_name = params[:controller] == 'goals' ? :id : :goal_id
    @goal = Goal.creator_or_participant(current_user).find(params[param_name])
  end
  
  def require_login
    unless current_user.present?
      redirect_to(new_user_session_path, :notice => 'Please log in') and return false
    end
  end
  
end
