class UiController < ApplicationController
  before_action :signed_in_user

  def index
    @projects=current_user.projects.all
    @tasks=current_user.tasks.all
    @task_new=current_user.tasks.new
  end

  def create 
    if current_user.projects.create!(name: "New list")
      @project=current_user.projects.first
      @tasks=current_user.tasks.all
      @task_new=current_user.tasks.new
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {render 'errors/error'}
      end
    end
  end

  def destroy
    if current_user.projects.find(params[:id]).destroy
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {render 'errors/error'}
      end
    end
  end

  def edit
    if @project=current_user.projects.find(params[:id])
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {render 'errors/error'}
      end
    end
  end
  
  def update
    @project=current_user.projects.find(params[:id])
    if @project.update_attributes(:name => params[:name])
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {render 'errors/prj_error'}
      end
    end
  end
end
