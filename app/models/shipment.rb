class Shipment < ApplicationRecord
  belongs_to :deal
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
