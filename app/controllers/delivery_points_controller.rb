class DeliveryPointsController < ApplicationController
  before_action :require_admin, except: [:index]
  before_action :set_delivery_point, only: [:show, :edit, :update, :destroy]

  # GET /delivery_points
  # GET /delivery_points.json
  def index
    @delivery_points = DeliveryPoint.all
  end

  # GET /delivery_points/1
  # GET /delivery_points/1.json
  def show
  end

  # GET /delivery_points/new
  def new
    @delivery_point = DeliveryPoint.new
  end

  # GET /delivery_points/1/edit
  def edit
  end

  # POST /delivery_points
  # POST /delivery_points.json
  def create
    @delivery_point = DeliveryPoint.new(delivery_point_params)

    respond_to do |format|
      if @delivery_point.save
        format.html { redirect_to @delivery_point, notice: 'Delivery point was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_point }
      else
        format.html { render :new }
        format.json { render json: @delivery_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_points/1
  # PATCH/PUT /delivery_points/1.json
  def update
    respond_to do |format|
      if @delivery_point.update(delivery_point_params)
        format.html { redirect_to @delivery_point, notice: 'Delivery point was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_point }
      else
        format.html { render :edit }
        format.json { render json: @delivery_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_points/1
  # DELETE /delivery_points/1.json
  # def destroy
  #   @delivery_point.destroy
  #   respond_to do |format|
  #     format.html { redirect_to delivery_points_url, notice: 'Delivery point was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_point
      @delivery_point = DeliveryPoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_point_params
      params.require(:delivery_point).permit(:name, :manager_id)
    end
end
