class PostsController < ApplicationController
	before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]

	def index
        @posts = Post.all
        @post = Post.new
        @post_comment = PostComment.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if  @post.save!
            redirect_to posts_path
            flash[:create] = "sucsecce"
        else
            redirect_to posts_path
            flash[:miss] = "miss"
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def update
         @post = Post.find(params[:id])
        if @post.update(post_params)
        redirect_to user_path(current_user)
        flash[:update] ="大成功."
        else
        render action: :edit
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to user_path(current_user)
    end

    private

    def post_params
        params.require(:post).permit(:id,:title, :body, :pet_name, :pet_age, :image_id,:pet_genre, :image)
    end

    def correct_user
        post = Post.find(params[:id])
        if current_user.id != post.user.id
           redirect_to posts_path
        end
    end


end
