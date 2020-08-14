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
      expect(@deal_shipment.errors.full_messages).to include("郵便番号が正しくありません。ハイフンを含めてください")
    end

    it "郵便番号が空だと保存できない" do
      @deal_shipment.post_code = ""
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("郵便番号を入力してください")
    end

    it "都道府県が空だと保存できない" do
      @deal_shipment.prefecture_id = ""
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("都道府県を入力してください")
    end

    it "市区町村が空だと保存できない" do
      @deal_shipment.city = ""
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("市区町村を入力してください")
    end

    it "市区町村に半角文字が入っていると保存できない" do
      @deal_shipment.city = "ﾖｺﾊﾏｼ"
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("市区町村が正しくありません。全角で入力してください")
    end

    it "番地が空だと保存できない" do
      @deal_shipment.address = ""
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("番地を入力してください")
    end

    it "電話番号が空だと保存できない" do
      @deal_shipment.phone_number = ""
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("電話番号を入力してください")
    end

    it "電話番号が12桁以上だと保存できない" do
      @deal_shipment.phone_number = "090123456789"
      @deal_shipment.valid?
      expect(@deal_shipment.errors.full_messages).to include("電話番号が正しくありません。最大11桁です")
    end
  end
end
