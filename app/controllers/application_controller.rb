class ApplicationController < ActionController::Base
	helper_method :current_user, :logged_in?

  USER_NAME, PASSWORD = 'demo', 'mango'
  before_action :http_basic_authenticate

	def current_user
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
		!!current_user
	end

	def require_user
		if !logged_in?
			redirect_to root_path
		end

	end

  def require_admin
    if logged_in? && current_user.admin
      # admin can acces this action
    else  
      redirect_to root_path
    end
  end

  private

  def http_basic_authenticate
    if Rails.env.staging?
      authenticate_or_request_with_http_basic do |user_name, password|
        user_name == USER_NAME && password == PASSWORD
      end
    end
  end

end
