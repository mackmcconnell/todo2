class TasksController < ApplicationController

  def index
    redirect_to list_path(params[:list_id])
  end

  # def new
  #   @task = Task.new
  # end
  
  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = Task.new(params[:task])
    @task.list_id = @list.id
    redirect_to list_path(params[:list_id]) if @task.save!
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @list = List.find(params[:list_id])
    @task= @list.tasks.find(params[:id])
    redirect_to @list if @task.destroy
  end
  
  def edit
    @task = Task.find(params[:id])
  end
end



