class Message < ApplicationRecord
	belongs_to :user
	validates :content, presence: true
  	belongs_to :room
end
