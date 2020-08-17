FactoryBot.define do
  factory :comment do
    text { "comment" }
    association :user
    association :item
  end
end
