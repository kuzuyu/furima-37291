FactoryBot.define do
  factory :item do
    item_name           {"名前"}
    item_information    {"説明"}
    price               {10000}
    item_condition_id       {1}
    postage_payer_id        {1}
    preparation_day_id      {1}
    area_id                 {1}
    category_id             {1}
  end
end