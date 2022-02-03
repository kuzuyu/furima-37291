class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_records = OrderRecords.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_records = OrderRecords.new(order_params)
    if @order_records.valid?
      @order_records.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_records).permit(:post_number, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
