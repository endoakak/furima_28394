FactoryBot.define do
  factory :deal_shipment do
    post_code { "123-4567" }
    prefecture_id { 2 }
    city { "旭川市" }
    address { "白山1-1" }
    building { "桜ビル102" }
    phone_number { "09012345678" }
    token { "token" }
    association :user
    association :item
  end
end
