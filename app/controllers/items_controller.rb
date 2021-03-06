class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_items, only: [:edit, :show, :update, :destroy ]
  before_action :corrent_user, only: [:edit, :destroy ]
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end    
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_information, :price, :category_id, :item_condition_id, :postage_payer_id, :area_id, :preparation_day_id, :image ).merge(user_id: current_user.id)
  end

  def set_items
    @item = Item.find(params[:id])
  end

  def corrent_user
    if @item.user_id == current_user.id && @item.record.nil?
    else
      redirect_to root_path
    end
  end
end
