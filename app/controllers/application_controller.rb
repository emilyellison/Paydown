class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :find_logged_in_user
  
  def find_logged_in_user
    @current_user = User.find_by_id(session[:user_id])
  end
  
  def check_for_logged_in_user
    if @current_user.nil?
      redirect_to new_session_url, notice: 'You must be logged in.'
    end
  end
end
