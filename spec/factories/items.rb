FactoryBot.define do
  factory :item do
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    item_name           {"名前"}
    item_information    {"説明"}
    price               {10000}
    item_condition_id       {2}
    postage_payer_id        {2}
    preparation_day_id      {2}
    area_id                 {2}
    category_id             {2}
  end
end