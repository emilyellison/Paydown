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
  
  def already_logged_in
    if @current_user.present?
      redirect_to root_url
      flash[:notice] = 'You\'re already logged in. You must sign out to sign up a new account.'
    end
  end
  
  def graduate?
    if @current_user && @current_user.graduate == false
      redirect_to user_url(@current_user.id), notice: 'You are not authorized to view this page.'
    end
  end
  
  def benefactor?
    if @current_user && @current_user.benefactor == false
      redirect_to user_url(@current_user.id), notice: 'You are not authorized to view this page.'
    end
  end
end
