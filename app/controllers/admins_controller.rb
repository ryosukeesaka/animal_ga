class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@users = User.with_deleted.all
	end

	def show
	end

	def edit
		@user = User.with_deleted.find(params[:id])

	end

	def update
	end

	def destroy
	end

end

	private
        def user_params
        params.require(:user).permit(:id,:first_name,:last_name,:first_name_kana,:last_name_kana,:address,:phone_number,:introduction, :Image,:email, :deleted_at, :user_status)
        end