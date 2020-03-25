class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  	def index
  		@users = User.with_deleted.all
  	end

  	def show
  		@user = User.with_deleted.find(params[:id])
  	end

  	def edit
  		@user = User.with_deleted.find(params[:id])
  	end

  	def update
  		@user = User.with_deleted.find(params[:id])
        if  params[:user_status] == "2" && @user.deleted_at.blank?
            @user.destroy!
        elsif params[:user_status] == "1" && @user.deleted_at.present?
                @user.restore!
        end
        if @user.update(user_params)
            redirect_to admins_users_path
            flash[:update] = "You have updated user successfully!!"
        else
        	render action: :edit
        end
  	end


	private
        def user_params
            params.require(:user).permit(:id,:admin,:first_name,:last_name,:first_name_kana,:last_name_kana,:phone_number,:introduction,:prefecture,:Image, :deleted_at, :user_status)
        end

end
