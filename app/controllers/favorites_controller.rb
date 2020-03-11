class FavoritesController < ApplicationController
	def create

        post = Post.find(params[:post_id])#投稿を見つける
        favorite = Favorite.new
        favorite.user_id = current_user.id
        favorite.post_id = params[:post_id]#favorieテーブルにuser/post.idが入る
        #favorite = current_user.favorites.new(post_id: post.id)#favoriteテーブルのpost_idカラムにbook.idを入れる
        favorite.save!
        if params[:q]#中身はl qは変数
        redirect_to posts_path
        else
        redirect_to post_path(post.id)
        end
    end
    def destroy
        post = Post.find(params[:post_id])
        favorite = current_user.favorites.find_by(post_id: post.id)
        favorite.destroy
         if params[:q]
        redirect_to posts_path
        else
        redirect_to post_path(post.id)
        end
    end

end
