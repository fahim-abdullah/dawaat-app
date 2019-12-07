class ProductsController < ApplicationController
	before_action :set_timezone
	before_action :require_user

	def index
		@products = Product.all
	end

	def edit
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_path
		else
			render 'new'
		end
	end

	def show
		@product = Product.find(params[:id])
	end
	
	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			# flash[:notice] = "Updated"
			redirect_to products_path
		else
			render 'new'
		end
	end
	
	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end

	private
	def product_params 
		params.require(:product).permit(:name, :price, :old_price, :status,
      :available_image, :soldout_image, :sequence)
	end
	def set_timezone
		Time.zone = "Dhaka"
	end
end