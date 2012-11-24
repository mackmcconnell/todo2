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
    task_params = params[:task]

    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)

    if @task.save
      respond_to do |format|
        format.js
      end
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @list = List.find(params[:list_id])
    @tasks = @list.tasks.active

    @task = Task.find(params[:id])

    @task.deactivate!

    respond_to do |format|
      format.js { render 'delete.js.erb' }
    end
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

  def send_sms
    @task = Task.find(params[:id])
    RemindersWorker.perform_async(@task)
  end
end