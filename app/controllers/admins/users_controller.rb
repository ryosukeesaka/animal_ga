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
  		@user = User.with_deleted.find(params[:id])#ユーザーの論理削除機能
        if  params[:user_status] == "2" && @user.deleted_at.blank?#退会ボタンが押されるかつユーザーのdeleted.atが存在しない場合
            @user.destroy!
        elsif params[:user_status] == "1" && @user.deleted_at.present?
                @user.restore!
        end
        if @user.update(user_params)
            redirect_to admins_users_path
            flash[:update] = "ユーザーの更新に成功しました"
        else
        	render action: :edit
        end
  	end


	private
        def user_params
            params.require(:user).permit(:id,:admin,:first_name,:last_name,:first_name_kana,:last_name_kana,:phone_number,:introduction,:prefectures,:Image, :deleted_at, :user_status)
        end

end
