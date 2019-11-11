class UsersController < ApplicationController
	before_action :set_timezone
	before_action :require_user, except: [:new, :create]

	def index
		@users = User.all
	end

	def myorders
		@user = User.find(session[:user_id]) if session[:user_id]
		@myorders = @user.orders.where('status=? OR status=?', 'Pending', 'On The Way')
	end

	def edit
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			# flash[:notice] = "Updated"
			redirect_to users_path
		else
			render 'new'
		end
	end
	
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	private
	def user_params 
		params.require(:user).permit(:username, :name, :password, :admin)
	end
	def set_timezone
		Time.zone = "Dhaka"
	end
end