class Card < ApplicationRecord
  belongs_to :user
  validates :card_token, presence: { message: "の入力に誤りがあります" }
  with_options presence: true do
    validates :customer_token
    validates :user
  end
end
