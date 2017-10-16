class LoginController < ApplicationController

	def index
		if session[:user]
			redirect_to controller: 'main', action: 'index'
		end
	end

	def login
		if params.has_key? :login and params.has_key? :password
			login = params[:login]
			password = params[:password]

			exists = User.exists?(login: login, password: password)

			if exists
				user = User.find_by login: login, password: password
				session[:user] = user.id
				redirect_to controller: 'main', action: 'index'
			else
				redirect_to action: 'index', error: 'yes'
			end
		else
			redirect_to action: 'index', error: 'yes'
		end
	end

	def logout
		reset_session
		redirect_to action: 'index'
	end

end