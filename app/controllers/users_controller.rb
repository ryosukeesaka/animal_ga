class UsersController < ApplicationController
	before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]
    
    def index
        @post = Post.new
    end
	def show
		@user = User.find(params[:id])

	end

	def create
	end

	def update
		@user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user.id)
            flash[:notice] = "You have updated user successfully."
        else
        	render action: :edit
        end
	end

	def edit
		@user = User.find(params[:id])
        if @user != current_user
            redirect_to user_path(current_user.id)
        end
	end


	 private
        def user_params
            params.require(:user).permit(:id,:first_name,:last_name,:first_name_kana,:last_name_kana,:phone_number,:introduction,:prefecture,:Image)
        end

    def correct_user
        @user = User.find(params[:id])
        if current_user != @user
           redirect_to user_path(current_user)
        end
    end
end
