class UsersController < ApplicationController
	before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]

    def index
        @post = Post.new
    end
	def show
		@user = User.with_deleted.find(params[:id])
        @users = User.with_deleted.all

	end

	def create
	end

	def update
		@user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user.id)
            flash[:update] = "You have updated user successfully!!"
        else
        	render action: :edit
        end
	end

	def edit
		@user = User.with_deleted.find(params[:id])
        if @user != current_user or @user.admin
            redirect_to user_path(current_user.id)
        end
	end

    def search
        @user_or_post = params[:option]
        @how_search = params[:choice]
            if @user_or_post == "1"
            @users = User.search(params[:search], @user_or_post,@how_search)#引数（パラメーター）を3つをモデルに渡す。
            else
            @posts = Post.search(params[:search], @user_or_post,@how_search)
            end
    end



	 private
        def user_params
            params.require(:user).permit(:id,:admin,:first_name,:last_name,:first_name_kana,:last_name_kana,:phone_number,:introduction,:prefecture,:Image, :user_status)
        end

    def correct_user
        @user = User.find(params[:id])
        if current_user != @user
           redirect_to user_path(current_user)
        end
    end
end
