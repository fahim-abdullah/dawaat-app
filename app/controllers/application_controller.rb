class ApplicationController < ActionController::Base
	helper_method :current_user, :logged_in?, :is_admin?

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

  def is_admin?
    logged_in? && current_user.admin
  end

  def require_admin
    if is_admin?
      # admin can acces this action
    else
      flash[:error] = 'Only admin can access this page'
      redirect_to root_path
    end
  end

  def delivery_point_id_required
    if params[:delivery_point_id]
      # TODO: check if user is manager of this delivery_point or admin
      
      # if is_admin? || DeliveryPoint.find(params[:delivery_point_id]).manager_id == current_user.id
      # 
      # else
      #  flash[:error] = 'Only manager can access this page'
      #  redirect_to delivery_points_url
      # end
    else
      flash[:error] = 'delivery_point_id is required'
      redirect_to delivery_points_url
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
