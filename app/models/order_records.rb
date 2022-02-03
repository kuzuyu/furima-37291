class OrderRecords
  include ActiveModel::Model
  attr_accessor :post_number, :area_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  validates :area_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/ }
    validates :token
  end

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Order.create(post_number: post_number, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, record_id: record.id)
  end
end