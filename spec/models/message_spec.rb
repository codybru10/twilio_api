require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message when number is invalid" do
  message = Message.new(:body => "hello", :to => '111111', :from => '5672805022')
   expect(message.save).to eq(false)
  end

  it "add an error if the number is invalid" do
    message = Message.new(:body => "hello", :to => '111111', :from => '5672805022')
    message.save
    binding.pry
    expect(message.errors.messages[:base]).to eq(["The 'To' number 1111111 is not a valid phone number."])
  end
end

RSpec.describe Message, type: :model do
  it { should belong_to :contact }
  it { should belong_to :user }
end
