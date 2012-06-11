class EducationsController < ApplicationController
  
  before_filter :check_for_logged_in_user
  
  def new
    @education = Education.new
  end
  
  def create
    @education = Education.new(params[:education])
    @education.user_id = @current_user.id
    if @education.save
      redirect_to user_url(@current_user.id), notice: 'Your education has been updated.'
    else
      render :new
    end
  end
  
  def edit
    @education = Education.find_by_id(params[:id])
  end
  
  def update
    @education = Education.find_by_id(params[:id])
    @education.update_attributes(params[:education])
    if @education.save
      redirect_to user_url(@current_user.id), notice: 'Your education has been updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @education = Education.find_by_id(params[:id])
    @education.destroy
    redirect_to user_url(@current_user.id), notice: 'Your education has been updated.'
  end
  
end