class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :deal, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_from
  belongs_to_active_hash :delivery_day

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :category
    validates :condition
    validates :delivery_fee
    validates :delivery_from
    validates :delivery_day
  end

  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9_999_999,
    message: "は300円から9,999,999円の間で記入してください"
  }
end
