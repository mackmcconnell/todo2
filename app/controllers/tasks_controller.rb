class TasksController < ApplicationController
  respond_to :html, :json

  def index
    redirect_to list_path(params[:list_id])
  end

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
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    respond_with @list
  end

end



