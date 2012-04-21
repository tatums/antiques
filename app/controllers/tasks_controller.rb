class TasksController < ApplicationController
  before_filter :require_user

  def index
    @tasks = Task.where(:deployed => false).order(:position)
    respond_to do |format|
      format.html
    end
  end

  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @task = Task.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
    end
  end

  def sort
    params[:tasks_in_order].each_with_index do |id, index|
      Task.where(:id => id.scan(/\d+/)).update_all(:position => index+1)
    end
    render :nothing => true
  end

end



