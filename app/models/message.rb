class Message < ApplicationRecord
	belongs_to :user
	validates  :content, length: { in: 1..100 }
  	belongs_to :room
end
