class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_from
  belongs_to_active_hash :delivery_day
  
  with_options presence: true do
    validates :name
    validates :text
    validates :category
    validates :condition
    validates :delivery_fee
    validates :delivery_from
    validates :delivery_day
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1, message: "must be selected"} do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :delivery_from_id
    validates :delivery_day_id
  end
end
