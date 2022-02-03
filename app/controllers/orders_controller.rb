class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :no_access_item, only: [:index, :create]

  def index
    @order_records = OrderRecords.new
  end

  def create
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

  def no_access_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.record.present?
  end

end
