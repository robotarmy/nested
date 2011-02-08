require 'spec_helper'

describe Message do
  it "takes my public key to make a message" do
    visit new_message_path
    fill_in 'message[body]' , :with => 'Hello there unknown - what time is it there?'
    fill_in 'message[identity][public_key]' , :with => 'd34db33f'
    click_button 'send'
  end
end
