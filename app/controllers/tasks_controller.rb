class TasksController < ApplicationController
  include Sort

  respond_to :html, :js
  before_filter :require_user

  def index
    @tasks = Task.where(:deployed => false).order(:position)
    respond_with(@tasks)
  end

  def show
    @task = Task.find(params[:id])
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      respond_with(@task, location: tasks_path)
    else
      respond_with(@task, location: new_task_path)
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      respond_with(@task, location: tasks_path)
    else
      respond_with(@task, location: edit_task_path)
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_with(@task, location: tasks_url)
  end

end
