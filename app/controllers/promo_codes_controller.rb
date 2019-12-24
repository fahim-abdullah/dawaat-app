class PromoCodesController < ApplicationController
  before_action :set_promo_code, only: [:show, :edit, :update, :destroy]

  # GET /promo_codes
  # GET /promo_codes.json
  def index
    @promo_codes = PromoCode.all
  end

  # GET /promo_codes/1
  # GET /promo_codes/1.json
  def show
  end

  # POST /promo_codes/apply
  def apply
    @promo_code = PromoCode.find_by_name(params[:promo_code])
    error_messages = []

    error_messages << 'Please input promo code' if params[:promo_code].empty?
    error_messages << 'Promo code not found' if @promo_code.nil?
    error_messages << 'Promo code expired' if @promo_code.present? && @promo_code.expiration_date < Time.now

    if error_messages.empty?
      render json: { promo_code: @promo_code.as_json, status: 200 }, status: :ok
    else
      render json: { error_messages: error_messages, status: 202 }, status: 202
    end
  end

  # GET /promo_codes/new
  def new
    @promo_code = PromoCode.new
  end

  # GET /promo_codes/1/edit
  def edit
  end

  # POST /promo_codes
  # POST /promo_codes.json
  def create
    @promo_code = PromoCode.new(promo_code_params)

    respond_to do |format|
      if @promo_code.save
        format.html { redirect_to @promo_code, notice: 'Promo code was successfully created.' }
        format.json { render :show, status: :created, location: @promo_code }
      else
        format.html { render :new }
        format.json { render json: @promo_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promo_codes/1
  # PATCH/PUT /promo_codes/1.json
  def update
    respond_to do |format|
      if @promo_code.update(promo_code_params)
        format.html { redirect_to @promo_code, notice: 'Promo code was successfully updated.' }
        format.json { render :show, status: :ok, location: @promo_code }
      else
        format.html { render :edit }
        format.json { render json: @promo_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promo_codes/1
  # DELETE /promo_codes/1.json
  def destroy
    @promo_code.destroy
    respond_to do |format|
      format.html { redirect_to promo_codes_url, notice: 'Promo code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promo_code
      @promo_code = PromoCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promo_code_params
      params.require(:promo_code).permit(:name, :promo_type, :discount_value, :minimum_amount, :expiration_date)
    end
end
