class Item < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :category, :condition, :delivery_fee, :delivery_from, :delivery_day
  
  with_options presence: true do
    validates :name
    validates :text
    validates :category
    validates :condition
    validates :delivery_fee
    validates :delivery_from
    validates :delivery_day
    validates :price
  end

  with_options numericality: { other_than: 1} do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :delivery_from_id
    validates :delivery_day_id
  end
end
