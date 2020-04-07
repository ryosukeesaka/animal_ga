class Admins::PostsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@posts = Post.all.order(created_at: :desc)
	end

	def destroy
		post = Post.find(params[:id])
		if post.destroy
		redirect_to admins_posts_path
		flash[:destroy] = "投稿を削除しました"
		end

	end
end
