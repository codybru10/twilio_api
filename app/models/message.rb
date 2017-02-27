class Message < ActiveRecord::Base
  before_create :send_sms
  belongs_to :user

  private
  def send_sms
    response = RestClient::Request.new(
    :method => :post,
    :url => 'https://api.twilio.com/2010-04-01/Accounts/AC4b1620503889020af7a27cf06a8f40b7/Messages.json',
    :user => ENV['TWILIO_ACCOUNT_SID'],
    :password => ENV['TWILIO_AUTH_TOKEN'],
    :payload => { :Body => body,
                  :From => from,
                  :To => to}
    ).execute
  end
end
AC4b1620503889020af7a27cf06a8f40b7
35b34fcab955b28a705e9cbd2f5e9b12
