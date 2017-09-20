class MainController < ApplicationController
	#http_basic_authenticate_with name: "n", password: "ice"

	def index
		@categories = Category.order :order
	end

end