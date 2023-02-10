class MessagesController < ApplicationController
    def create
        @user = User.find(session[:user_id])
        @message = Message.new
        @message.content = params[:message][:content]
        @message.user_id = params[:message][:user_id]
        @message.room_id = params[:message][:room_id]

        @message.save
    end
end