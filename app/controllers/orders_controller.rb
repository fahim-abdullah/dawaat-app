class OrdersController < ApplicationController
	before_action :set_timezone
	before_action :require_user, except: [:new]
  before_action :require_admin, only: :ongoing

	def index
		@orders = Order.all
	end

	def ongoing
		@orders = Order.all
	end

	def edit
		@order = Order.find(params[:id])
	end

	def assign
		@order = Order.find(params[:order_id])
	end

	def cancel
		@order = Order.find(params[:order_id])
	end

	def deliver 
		@order = Order.find(params[:order_id])
	end

	def new
		@disable_footer = true
		@disable_navbar = true

		@beef_tehari = Product.where(:name => "Signature Tehari")[0]
		@chicken_tehari = Product.where(:name => "Chicken Tehari")[0]
		@polao_roast = Product.where(:name => "Fried Chicken Roast & Pulao")[0]
		@firni_reg = Product.where(:name => "Firni (Regular)")[0]
		@firni_lg = Product.where(:name => "Firni (Large)")[0]
		# @coke_med = Product.where(:name => "Coke (600 ml)")[0]
		# @coke_lg = Product.where(:name => "Coke (1.25L)")[0]

		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		if @order.save
			redirect_to orders_path
		else
			render 'new'
		end
	end

	def show
		@order = Order.find(params[:id])
	end
	
	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			# flash[:notice] = "Updated"
			redirect_to orders_path
		else
			render 'new'
		end
	end
	
	def destroy
		@order = Order.find(params[:id])
		@order.destroy
		redirect_to orders_path
	end

	private
	def order_params 
		params.require(:order).permit(:fullname, :phone, :address, :flathouse, :road, :latlng, :subtotal, :itemquantity, :existing, :status, :ontheway_time, :delivery_time, :instructions, :user_id)
	end
	def set_timezone
		Time.zone = "Dhaka"
	end
end