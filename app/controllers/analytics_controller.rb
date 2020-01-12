class AnalyticsController < ApplicationController
  before_action :delivery_point_id_required
  before_action :is_admin_or_delivery_point_manager

  def date_range
    @from_date = params[:from_date].present? ? params[:from_date] : 10.days.ago.strftime("%Y-%m-%d")
    @to_date = params[:to_date].present? ? params[:to_date] : Time.now.strftime("%Y-%m-%d")

    @orders_total = Order.where(delivery_point_id: params[:delivery_point_id])
                         .where("created_at >= '#{@from_date}'")
                         .where("created_at <= '#{@to_date}'")
                         .group("DATE(created_at)")
                         .sum(:total)
  end
end
