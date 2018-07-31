class TasksController < ApplicationController

  def create
    if current_user.tasks.create!(task_params)
      @task = current_user.tasks.first
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {render 'errors/task_error'}
      end
    end
  end

  def destroy
    current_user.tasks.find(params[:id]).destroy
    respond_to do |format|
      format.js
    end
  end

  def edit
    @task=current_user.tasks.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @task=current_user.tasks.find(params[:id])
    if @task.update_attributes(:name => params[:name])
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {render 'errors/task_error'}
      end
     end
  end

  def check
    @task=current_user.tasks.find(params[:id])
    @task.update_attributes(:status => true)
    respond_to do |format|
      format.js
    end
  end

  def uncheck
    @task=current_user.tasks.find(params[:id])
    @task.update_attributes(:status => false)
    respond_to do |format|
      format.js
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :project_id)
    end
end
