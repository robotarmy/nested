require 'spec_helper'

describe Message do
  context "takes my public key to make a message" do
    let(:post_message) do
      visit new_message_path
      fill_in 'message[body]' , :with => 'Hello there unknown - what time is it there?'
      fill_in 'message[identity_attributes][public_key]' , :with => 'd34db33f'
      click_button 'send'
      Message.last
    end

    it "creates a message" do
      lambda {
        post_message
      }.should change(Message,:count).by(1)
    end

    it "creates an identity"
    it "creates a message with an identity" 
  end
end
