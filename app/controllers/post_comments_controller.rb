class PostCommentsController < ApplicationController
	def create
		#comment = Post.find(params[:post_id]).post_comments.new(post_comment_params)
		#comment.user_id = current_user.id
		comment = PostComment.new(comment: params[:post_comment][:comment],
		                          post_id: params[:post_id],#urlからパラメーター受け取ってくる
		                          user_id: current_user.id)
		post = Post.find(params[:post_id])

		comment.save!
		redirect_to posts_path
	end

	def destroy
		post = Post.find(params[:post_id])
		comment = PostComment.find(params[:id])
        comment.destroy
        redirect_to posts_path
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end
