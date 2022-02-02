class OrdersController < ApplicationController

  def index
  end

  def create
    @order = OrderRecords.new(order_params)
  end

  private

  def order_params
    params.permit(:post_number, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
