class DealShipment
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "が正しくありません。ハイフンを含めてください" }
    validates :prefecture_id
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "が正しくありません。全角で入力してください" }
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: "が正しくありません。最大11桁です" }
  end

  def save
    deal = Deal.create(user_id: user_id, item_id: item_id)
    Shipment.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city, address: address,
      building: building,
      phone_number: phone_number,
      deal_id: deal.id
    )
  end
end
