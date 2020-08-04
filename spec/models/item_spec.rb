require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#create" do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("public/images/test_image.png")
    end

    it "情報が揃っていれば出品できる" do
      expect(@item).to be_valid
    end

    it "画像がなければ出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名がなければ出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明がなければ出品できない" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it "カテゴリー情報がなければ出品できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be selected")
    end

    it "商品の状態の情報がなければ出品できない" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be selected")
    end

    it "配送料の負担の情報がなければ出品できない" do
      @item.delivery_fee_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be selected")
    end

    it "発送元の情報がなければ出品できない" do
      @item.delivery_from_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery from must be selected")
    end

    it "発送までの日数の情報がなければ出品できない" do
      @item.delivery_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day must be selected")
    end

    it "価格がなければ出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be a number between 300 and 9,999,999")
    end

    it "価格が300円未満では出品できない" do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be a number between 300 and 9,999,999")
    end

    it "価格が9,999,999円以上では出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be a number between 300 and 9,999,999")
    end
  end
end
