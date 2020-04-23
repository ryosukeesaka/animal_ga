class PostCommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		comment = Post.find(params[:post_id]).post_comments.new(post_comment_params)
		comment.user_id = current_user.id
		@post = Post.find(params[:post_id])
		@post_comment = PostComment.new
		comment.save!

	end

	def destroy
		@post = Post.find(params[:post_id])
		@post_comment = PostComment.find(params[:id])
        @post_comment.destroy
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
