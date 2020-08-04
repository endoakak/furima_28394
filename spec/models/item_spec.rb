require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "#create" do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it "情報が揃っていれば出品できる" do
      
    end

    it "画像がなければ出品できない" do

    end

    it "商品名がなければ出品できない" do

    end

    it "商品の説明がなければ出品できない" do

    end

    it "カテゴリー情報がなければ出品できない" do

    end

    it "商品の状態の情報がなければ出品できない" do

    end

    it "配送料の負担の情報がなければ出品できない" do

    end

    it "発送元の情報がなければ出品できない" do

    end

    it "発送までの日数の情報がなければ出品できない" do

    end

    it "価格がなければ出品できない" do

    end

    it "価格が300円未満では出品できない" do

    end

    it "価格が9,999,999円以上では出品できない" do

    end

  end
end
