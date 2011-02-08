require 'spec_helper'

describe Message do
  context "takes my public key to make a message" do
    let(:message_size) do
      Message.count
    end
    before do
      visit new_message_path
      fill_in 'message[body]' , :with => 'Hello there unknown - what time is it there?'
      fill_in 'message[identity][public_key]' , :with => 'd34db33f'
      click_button 'send'
    end

    it "creates a message" do
      message_size.should < Message.count
    end

    it "creates an identity"
    it "creates a message with an identity" 
  end
end
