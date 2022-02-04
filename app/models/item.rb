class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage_payer
  belongs_to :area
  belongs_to :preparation_day
  has_one_attached :image
  has_one    :record

  validates :item_name, presence: true
  validates :item_information, presence: true 
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,  }
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :postage_payer_id, presence: true
  validates :area_id, presence: true
  validates :preparation_day_id, presence: true
  validates :image, presence: true 

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'には半角数字を使用してください' } do
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_payer_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :preparation_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  
end
