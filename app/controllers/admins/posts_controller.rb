class Admins::PostsController < ApplicationController
	before_action :authenticate_admin!

	def index
		@posts = Post.all
	end

	def destroy
		post = Post.find(params[:id])
		if post.destroy
		redirect_to admins_posts_path
		flash[:destroy] = "destroy successfully!!"

	end
end
