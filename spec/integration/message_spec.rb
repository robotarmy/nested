require 'spec_helper'

describe Message do
  context "takes my public key to make a message" do
    PUBLIC_KEY=%%d34db33f%

    def post_message
      visit new_message_path
      fill_in 'message[body]' , :with => 'Hello there unknown - what time is it there?'
      fill_in 'message[identity_attributes][public_key]' , :with => PUBLIC_KEY
      click_button 'send'
    end

    it "creates a message" do
      lambda {
        post_message
      }.should change(Message,:count).by(1)
    end

    it "creates an identity" do
      lambda {
        post_message
      }.should change(Identity,:count).by(1)

      lambda {
        post_message
      }.should_not change(Identity,:count).by(1)
    end

    it "creates a message with an identity" do
      post_message
      message = Message.last
      message.identity.should_not be_nil
      message.identity.should == Identity.find_by_public_key(PUBLIC_KEY)
    end
  end
end
