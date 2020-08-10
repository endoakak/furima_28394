require 'rails_helper'

RSpec.describe DealShipment, type: :model do
  describe "購入情報の保存" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.image = fixture_file_upload("public/images/test_image.png")
      item.save
      sleep 0.5
      @deal_shipment = FactoryBot.build(:deal_shipment, user_id: user.id, item_id: item.id)
    end

    it "全ての値が正しく入力されていれば保存できる" do
      expect(@deal_shipment).to be_valid
    end

    it "郵便番号にハイフンがないと保存できない" do
      @deal_shipment.post_code = "1234567"
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it "郵便番号が空だと保存できない" do
      @deal_shipment.post_code = ""
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it "都道府県が空だと保存できない" do
      @deal_shipment.prefecture_id = ""
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "市区町村が空だと保存できない" do
      @deal_shipment.city = ""
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("City can't be blank")
    end

    it "市区町村に半角文字が入っていると保存できない" do
      @deal_shipment.city = "ﾖｺﾊﾏｼ"
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("City is invalid. Input full-width characters.")
    end

    it "番地が空だと保存できない" do
      @deal_shipment.address = ""
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("Address can't be blank")
    end

    it "電話番号が空だと保存できない" do
      @deal_shipment.phone_number = ""
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号が12桁以上だと保存できない" do
      @deal_shipment.phone_number = "090123456789"
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("Phone number is invalid. Maximun 11 digit number")
    end
  end
end
