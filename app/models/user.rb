class User < ApplicationRecord

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    attachment :Image
    acts_as_paranoid

    validates :last_name, presence: true
    validates :last_name_kana, presence: true
    validates :first_name, presence: true
    validates :first_name_kana, presence: true
    validates :Image, presence: true
    validates :prefectures, presence: true
    validates :phone_number, presence: true


    has_many :posts, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy#外部キーで指定しないとfollowerかfollowedどちらを取るか区別できない。
    has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy#フォロワー取得
    has_many :following_user, through: :follower, source: :followed
    has_many :followed_user, through: :followed, source: :follower
    has_many :messages, dependent: :destroy
    has_many :entries, dependent: :destroy

    def follow(user_id)
        follower.create(followed_id: user_id)#ユーザーをフォローする
    end


    def unfollow(user_id)
        follower.find_by(followed_id: user_id).destroy#ユーザーのフォローを外す
    end


    def following?(user)
        following_user.include?(user)#フォローしていればtrueを返す
    end

    def User.search(search, user_or_post, how_search)
        if user_or_post == "1"
            if how_search == "1"
                User.where(["last_name LIKE ? or first_name LIKE ?","%#{search}%" ,"%#{search}%"])
            elsif how_search == "2"
                User.where(['last_name LIKE ? or first_name LIKE ?',"%#{search}", "%#{search}"])
            elsif how_search == "3"
                User.where(['last_name LIKE ? or first_name LIKE ?',"#{search}%", "#{search}%"])
            elsif how_search == "4"
                User.where(['last_name = ? or first_name = ? ',"#{search}", "#{search}"])
            else

                User.all
            end
        end
    end

    private
        def before_validations
        phone_number.strip!# post_codeとtelの文字列から先頭と末尾のスペースを除去する
        end



end
