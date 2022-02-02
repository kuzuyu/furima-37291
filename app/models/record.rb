class Record < ApplicationRecord

  belongs_to :user
  belongs_to :item
  belongs_to :area
  has_one :order

end
