class OrdersController < ApplicationController
	before_action :set_timezone
	before_action :require_user, except: [:new, :create]
  
  before_action :delivery_point_id_required, only: [:ongoing]
  before_action :is_admin_or_delivery_point_manager, only: :ongoing

	def index
		@orders = Order.all
	end

	def ongoing
    @delivery_point = DeliveryPoint.find(params[:delivery_point_id])
		@orders = @delivery_point.orders.where('status=? OR status=?', 'Pending', 'On The Way')
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

		# @beef_tehari = Product.where(:name => "Signature Tehari")[0]
		# @chicken_tehari = Product.where(:name => "Chicken Tehari")[0]
		# @polao_roast = Product.where(:name => "Fried Chicken Roast & Polao")[0]
		# @firni_reg = Product.where(:name => "Firni (Regular)")[0]
		# @firni_lg = Product.where(:name => "Firni (Large)")[0]
		# @coke_med = Product.where(:name => "Coke (600 ml)")[0]
		# @coke_lg = Product.where(:name => "Coke (1.25L)")[0]

    @products = Product.all

		@order = Order.new
	end

	def admin_order
		@disable_footer = true
		@products = Product.all
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)

		if @order.save

      #--insert-order-items
      subtotal = 0
      order_items_string = params[:order_items_string]
      order_items_string.split('---').each do |item_info|
        info_arr = item_info.split('...')
        product_id = info_arr[0]
        product_quantity = info_arr[1]
        product = Product.find(product_id)

        subtotal += product.price.to_i * product_quantity.to_i

        @order.order_items.create(product_id: product_id,
          product_name: product.name, price: product.price, quantity: product_quantity)
      end

      #-----------------------------------------------------------------------------------

      if params['promo_code'].present?
        @order.apply_promo_code(promo_code_name: params['promo_code'], subtotal_amount: subtotal)
      else
        @order.subtotal = subtotal
        @order.discount = 0
        @order.total = subtotal
        @order.save(validate: false)
      end

      #-----------------------------------------------------------------------------------

			redirect_to thankyou_path
		else
      @products = Product.all
      if params['page_name'].present? && params['page_name'] == 'admin_order'
        render 'admin_order'
      else
        render 'new'
      end
		end
	end

	def show
		@order = Order.find(params[:id])
	end
	
	def update
		@order = Order.find(params[:id])
    old_user_id = @order.user_id
		if @order.update(order_params)

      if old_user_id == @order.user_id
        flash[:warning] = "Order##{@order.id} updated but Delivery man not changed"
      else
        flash[:notice] = "Order##{@order.id} is assigned to User##{@order.user_id}"
      end

			# flash[:notice] = "Updated"
			redirect_to ongoing_url(delivery_point_id: @order.delivery_point_id)
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
		params.require(:order).permit(:fullname, :phone, :address, :flathouse, 
      :road, :latlng, :subtotal, :itemquantity, :existing, :status, :lat, :lng,
      :ontheway_time, :delivery_time, :instructions, :user_id, :delivery_point_id, :source)
	end
	def set_timezone
		Time.zone = "Dhaka"
	end
end