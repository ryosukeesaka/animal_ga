class Post < ApplicationRecord
	belongs_to :user
	attachment :image
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    def favorited_by?(user)
            favorites.where(user_id: user.id).exists?
    end

	enum pet_age: { "0歳": 0, "1歳": 1, "2歳": 2, "3歳":3, "4歳":4,"5歳":5,"6歳":6,"7歳":7,"8歳":8,"9歳":9,"10歳":10,
		"11歳":11,"12歳":12,"13歳":13,"14歳":14,"15歳":15,"16歳":16,"17歳":17,"18歳":18,"19歳":19,"20歳":20,"21歳〜":21 }
	enum pet_genre: { "犬":0, "猫":1, "ウサギ":2, "ハムスター":3, "ハリネズミ":4, "鳥":5, "亀":6, "その他":7}



end
