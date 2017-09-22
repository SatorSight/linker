class MainController < ApplicationController
	#http_basic_authenticate_with name: "n", password: "ice"

	def index
		if not session[:user].present?
			redirect_to controller: 'login', action: 'index'
		end
		@categories = Category.order :order
		@all_links = Link.order created_at: :desc
	end

end