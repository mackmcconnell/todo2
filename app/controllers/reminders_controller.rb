class RemindersController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @task = Task.find(params[:task_id])
    @reminder = Reminder.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @list = List.find(params[:list_id])
    @task = Task.find(params[:task_id])
    @reminder = Reminder.new(params[:reminder])
    @reminder.task_id = @task.id
    redirect_to lists_path if @reminder.save
  end

end


