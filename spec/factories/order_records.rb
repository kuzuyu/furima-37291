FactoryBot.define do
  factory :order_records do
    token   {1}
    post_number { '123-4567' }
    area_id { 2 }
    city { '大阪' }
    address { '1-1' }
    building_name { 'ハイツ' }
    phone_number {'00011112222'}
  end
end
