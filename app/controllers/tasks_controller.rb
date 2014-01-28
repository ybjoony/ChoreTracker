class TasksController < ApplicationController
  before_filter :login_required

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.' 
    else
      render action: "new"
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @task, notice: 'Task was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end
end
