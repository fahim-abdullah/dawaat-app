class OrdersController < ApplicationController
	before_action :set_timezone

	def index
		@orders = Order.all
	end

	def edit
		@order = Order.find(params[:id])
	end

	def new
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
		params.require(:order).permit(:fullname, :phone, :address, :flathouse, :road, :latlng, :subtotal, :itemquantity, :existing, :status, :ontheway_time, :delivery_time)
	end
	def set_timezone
		Time.zone = "Dhaka"
	end
end