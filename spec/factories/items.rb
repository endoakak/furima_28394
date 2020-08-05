FactoryBot.define do
  factory :item do
    name { "商品" }
    text { "商品の説明" }
    price { 10_000 }
    category { Category.all.sample }
    condition { Condition.all.sample }
    delivery_fee { DeliveryFee.all.sample }
    delivery_from { DeliveryFrom.all.sample }
    delivery_day { DeliveryDay.all.sample }
    association :user
  end
end
