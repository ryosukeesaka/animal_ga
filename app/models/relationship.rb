class Relationship < ApplicationRecord
	belongs_to :follower, class_name: "User" #followモデルなんて存在しないので、userモデルにbelongs_toしてね！
	belongs_to :followed, class_name: "User"
end
