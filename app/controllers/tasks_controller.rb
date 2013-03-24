class TasksController < ApplicationController
  before_filter :require_user
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
    respond_with(@task)
  end

  def create
    @task = Task.new(params[:task])
    flash[:notice] = 'Task was successfully created.' if @task.save
    respond_with(@task)
  end

  def update
    @task = Task.find(params[:id])
    flash[:notice] = 'Task was successfully created.' if @task.update_attributes(params[:task])
    respond_with(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_with(@task)
  end

end
