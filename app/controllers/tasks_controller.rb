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

    if params[:completed] == 'true'
      @task.update_attributes(:completed =>true)
    end

    if params[:deployed] == 'true'
      @task.update_attributes(:deployed =>true)
    end

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
        format.js
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
    generic_sort(params[:tasks_in_order], 'Task')
    render :nothing => true
  end

end



