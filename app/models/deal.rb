class Deal < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipment, dependent: :destroy
end
