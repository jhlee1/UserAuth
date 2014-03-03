class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

	def authorize
		if current_user.nil?
			session[:protected_page] = request.fullpath
			redirect_to sign_in_url, alert: 'You must login to view that page.'
		end
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def login(user)
		reset_session
		session[:user_id] = user.id
	end

	def logout
		reset_session
		session[:user_id] = nil
	end
end