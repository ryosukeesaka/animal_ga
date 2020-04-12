class RelationshipsController < ApplicationController
    before_action :authenticate_user!

	def create
        @user = User.find(params[:id])
        follow = current_user.follow(params[:id])
        respond_to do |format|
            format.js
        end
    end

    def  destroy
    	@user = User.find(params[:id])
        current_user.unfollow(params[:id])
    end

    def follows
        @user = User.find(params[:id])
    end

    def followers
        @user = User.find(params[:id])
    end
end
