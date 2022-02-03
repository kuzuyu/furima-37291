class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_records = OrderRecords.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_records = OrderRecords.new(order_params)
    if @order_records.valid?
      pay_item
      @order_records.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_records).permit(:post_number, :area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end

end
