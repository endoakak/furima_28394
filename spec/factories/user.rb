FactoryBot.define do
  factory :user do
    nick_name {Faker::Internet.username}
    email {Faker::Internet.free_email}
    password = Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)
    password {password}
    password_confirmation {password}
    last_name {Gimei.last}
    first_name {Gimei.first}
    last_name_kana {Gimei.last.katakana}
    first_name_kana {Gimei.first.katakana}
    birthday {Faker::Date.birthday(min_age: 5, max_age: 90)}
  end
end