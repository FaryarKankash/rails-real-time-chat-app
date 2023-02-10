class RoomsController < ApplicationController

    before_action :_authenticate

    def index
        @rooms = Room.all
        @user = User.find(session[:user_id])
    end

    def show
        @room = Room.find(params[:id])
        @user = User.find(session[:user_id])
        @message = Message.new
        @messages = Message.find_by(room_id: @room.id)
    end


    private
    def _authenticate
        if !session[:user_id]
            redirect_to "/sign"
        end
    end
end