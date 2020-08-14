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
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end

    it "商品名がなければ出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it "商品の説明がなければ出品できない" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it "カテゴリー情報がなければ出品できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end

    it "商品の状態の情報がなければ出品できない" do
      @item.condition_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")
    end

    it "配送料の負担の情報がなければ出品できない" do
      @item.delivery_fee_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end

    it "発送元の情報がなければ出品できない" do
      @item.delivery_from_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end

    it "発送までの日数の情報がなければ出品できない" do
      @item.delivery_day_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end

    it "価格がなければ出品できない" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は300円から9,999,999円の間で記入してください")
    end

    it "価格が300円未満では出品できない" do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は300円から9,999,999円の間で記入してください")
    end

    it "価格が9,999,999円以上では出品できない" do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は300円から9,999,999円の間で記入してください")
    end
  end
end
