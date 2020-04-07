class HomesController < ApplicationController

	def top
		flash[:logout] = "ログアウトしました"
	end
end
