class UsersController < ApplicationController
  
  before_filter :already_logged_in, only: [ :new, :create ]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to new_session_url, notice: 'Congrats on signing up for Gradship!'
    else
      render :new
    end
  end
  
  def show
    check_for_logged_in_user
    @user = User.find_by_id(params[:id])
    @education = @user.educations.order('end_year desc')
    @story = @user.story
  end
  
  def edit
    @user = User.find_by_id(params[:id])
  end
  
  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(params[:user])
    if @user.save
      redirect_to user_url(@user.id), notice: 'Your profile has been updated.'
    else
      render :new
    end
  end
  
end