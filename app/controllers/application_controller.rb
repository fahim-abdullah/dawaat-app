class ApplicationController < ActionController::Base
	helper_method :current_user, :logged_in?

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

end
