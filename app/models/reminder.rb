class Reminder < ActiveRecord::Base
  attr_accessible :task_id, :time, :date
  belongs_to :task
  after_create :send_sms


  def send_sms
    @task = Reminder.last.task
    current_user = Reminder.last.task.list.user
    account_sid = "ACe3f08f26920946de8394b08ad903b161"
    auth_token = "c86b4df4b436dbf4f4b202ef11196d46"
    client = Twilio::REST::Client.new account_sid, auth_token

    from = "+18473803186" # Your Twilio number
    contact_info = {
    current_user.phone_number => task.description,
    }
    contact_info.each do |key, value|
      client.account.sms.messages.create(
        :from => from,
        :to => key,
        :body => value
      )
      puts "Sent message to #{value}"
    end
  end
end
