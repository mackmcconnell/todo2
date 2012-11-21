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
    account_sid = "ACe3f08f26920946de8394b08ad903b161"
    auth_token = "c86b4df4b436dbf4f4b202ef11196d46"
    client = Twilio::REST::Client.new account_sid, auth_token
     
    from = "+18473803186" # Your Twilio number
     
    contact_info = {
    current_user.phone_number => @task.description,
    }
    contact_info.each do |key, value|
      client.account.sms.messages.create(
        :from => from,
        :to => key,
        :body => value
      ) 
      puts "Sent message to #{value}"
    end
    redirect_to list_path
  end
end