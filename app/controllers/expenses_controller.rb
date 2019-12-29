class ExpensesController < ApplicationController
	before_action :set_timezone
	before_action :require_user
  before_action :delivery_point_id_required, only: [:index, :new, :create]

	def index
    @delivery_point = DeliveryPoint.find(params[:delivery_point_id])
		@expenses = @delivery_point.expenses
	end

	def edit
		@expense = Expense.find(params[:id])
	end

	def new
    @delivery_point = DeliveryPoint.find(params[:delivery_point_id])
		@expense = Expense.new
	end

	def create
		@expense = Expense.new(expense_params)
    @expense.delivery_point_id = params[:delivery_point_id]
		if @expense.save
			redirect_to expenses_url(delivery_point_id: params[:delivery_point_id])
		else
      @delivery_point = DeliveryPoint.find(params[:delivery_point_id])
			render 'new'
		end
	end

	def show
		@expense = Expense.find(params[:id])
	end
	
	def update
		@expense = Expense.find(params[:id])
		if @expense.update(expense_params)
			# flash[:notice] = "Updated"
			redirect_to expenses_url(delivery_point_id: @expense.delivery_point_id)
		else
			render 'edit'
		end
	end
	
	def destroy
		@expense = Expense.find(params[:id])
		@expense.destroy
		redirect_to expenses_path
	end

	private
	def expense_params 
		params.require(:expense).permit(:purpose, :user, :amount)
	end
	def set_timezone
		Time.zone = "Dhaka"
	end
end