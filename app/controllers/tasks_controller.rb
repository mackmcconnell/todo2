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
    @task.alive = "yes"
    # redirect_to list_path(params[:list_id]) if @task.save!
    if @task.save
      respond_to do |format|
        format.js { render 'create.js.erb' }
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
    @task.update_attribute(:alive, "no")
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


end



