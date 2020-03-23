class UsersController < ApplicationController
	before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]

    def index
        @post = Post.new
    end
	def show

		@user = User.with_deleted.find(params[:id])
        @users = User.with_deleted.all
        @current_user_entry=Entry.where(user_id: current_user.id)#@current_user.entry何が違う？ _enry
        @user_entry=Entry.where(user_id: @user.id)
        unless @user.id == current_user.id
            @current_user_entry.each do |cu|
                @user_entry.each do |u|
                    #roomが作成されている場合
                    if cu.room_id == u.room_id then
                        @is_room = true
                        @room_id = cu.room_id#@room.idはだめ？
                    end
                end
            end#roomを新しく作成する場合
            if @isRoom
            else
                @room = Room.new
                @entry = Entry.new
            end
        end
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

    def withdraw
        @user = User.with_deleted.find(params[:id])
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to posts_path
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
