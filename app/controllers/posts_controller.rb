class PostsController < ApplicationController
	before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update, :destroy]

	def index
        @posts = Post.all.order(created_at: :desc)
        @post = Post.new
        @post_comment = PostComment.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @posts = Post.all.order(created_at: :desc)
        @post_comment = PostComment.new

        if  @post.save
            redirect_to posts_path
            flash[:create] = "投稿しました"
        else
            render "index" #失敗した場合
        end
    end


    def update
         @post = Post.find(params[:id])
        if @post.update(post_params)
        redirect_to user_path(current_user)
        flash[:notice] ="更新しました"
        else
        render "edit"
        flash[:alert] = "編集に失敗しました。"
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def transfer
        @posts = Post.where(transfer: true).order(created_at: :desc)
        @post_comment = PostComment.new
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to user_path(current_user)
        flash[:destroy] = "投稿を削除しました"
    end

    private

    def post_params
        params.require(:post).permit(:id,:title, :body, :pet_name, :pet_age, :image_id, :pet_genres, :image, :transfer, :transfer_land)
    end

    def correct_user
        post = Post.find(params[:id])
        if current_user.id != post.user.id
           redirect_to posts_path
        end
    end


end
