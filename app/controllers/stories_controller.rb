class StoriesController < ApplicationController
  
  before_filter :check_for_logged_in_user
  
  def new
    @story = Story.new
  end
  
  def create
    @story = Story.new(params[:story])
    @story.user_id = @current_user.id
    if @story.save
      redirect_to user_url(@current_user.id), notice: 'Your story has been updated.'
    else
      render :new
    end
  end
  
  def edit
    @story = Story.find_by_id(params[:id])
  end
  
  def update
    @story = Story.find_by_id(params[:id])
    @story.update_attributes(params[:story])
    if @story.save
      redirect_to user_url(@current_user.id), notice: 'Your story has been updated.'
    else
      render :edit
    end
  end
  
end