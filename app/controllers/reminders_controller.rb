class RemindersController < ApplicationController

  def index

  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.find(params[:task_id])
    @reminder = Reminder.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = Task.find(params[:task_id])
    @reminder = Reminder.new(params[:reminder])
    @reminder.task_id = @task.id
    redirect_to lists_path if @list.save
  end

end
