class OrderRecords
  include ActiveModel::Model
  attr_accessor :post_number, :area_id, :city, :address, :building_name, :phone_number, :item, :user

  def save
    Order.create( post_number :post_number, area_id :area_id, address :address, building_name :building_name, phone_number :phone_number )
    records = Records.create( user :user, item :item )
  end
end