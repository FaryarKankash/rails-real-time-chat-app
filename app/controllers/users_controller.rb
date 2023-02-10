class UsersController < ApplicationController
    def new

    end

    def create
        # @user = User.create(params.require(:user).permit(:email , :password))
        @user = User.new
        @user.email = params[:user][:email]
        @user.password_digest = BCrypt::Password.create(params[:user][:password])
        if @user.save
            flash[:notice] = "User created!"
            redirect_to "/sign"
        else
            flash[:notice] = "Error!"
        end
    end

    def signpage
    end

    def sign
        @user = User.find_by(email: params[:user][:email])
        if @user
            @isTrue = @user.authenticate(params[:user][:password])
            if @isTrue
                session[:user_id] = @isTrue.id
                redirect_to "/rooms"
            else
                puts("Error! Error! Error! Error!")
            end
        end
    end
end