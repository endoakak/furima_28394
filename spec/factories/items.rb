FactoryBot.define do
  factory :item do
    name { "商品" }
    text { "商品の説明" }
    price { 10000 }
    category_id { 2 }
    condition_id { 2 }
    delivery_fee_id { 2 }
    delivery_from_id { 2 }
    delivery_day_id { 2 }
    association :user
  end
end
