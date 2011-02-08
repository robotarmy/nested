class MessagesController < ApplicationController
  def new
  end
  def create
    Message.create!(params[:message])
  end
end
