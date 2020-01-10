class AnalyticsController < ApplicationController
  before_action :delivery_point_id_required
  before_action :is_admin_or_delivery_point_manager

  def date_range
    @start_date = 10.days.ago
    @end_date = Time.now

    @orders_total = {}

    #///////////////#

    @orders_total = Order.where(delivery_point_id: params[:delivery_point_id]).group("DATE(created_at)").sum(:total)


  end
end
