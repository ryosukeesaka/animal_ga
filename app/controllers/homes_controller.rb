class HomesController < ApplicationController

	def top
		flash[:logout] = "Signed out successfully."
	end
end
