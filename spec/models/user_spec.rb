require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    before do 
      @user = FactoryBot.build(:user)
    end

    it "正しく揃っていたら保存できる" do
      expect(@user).to be_valid
    end
    it "nick_nameが空だと保存できない" do
      
    end
    it "emailが空だと保存できない" do
      
    end
    it "emailが被っていると保存できない" do
      
    end
    it "emailに@がないと保存できない" do
      
    end
    it "passwordが空だと保存できない" do
      
    end
    it "passwordが6文字以上でないと保存できない" do
      
    end
    it "passwordが英数字混合出ないと保存できない" do
      
    end
    it "passwordの確認が正しくないと保存できない" do
      
    end
    it "last_nameが空だと保存できない" do
      
    end
    it "first_nameが空だと保存できない" do
      
    end
    it "last_nameが全角でないと保存できない" do
      
    end
    it "first_nameが全角でないと保存できない" do
      
    end
    it "last_name_kanaが空だと保存できない" do
      
    end
    it "first_name_kanaが空だと保存できない" do
      
    end
    it "last_name_kanaがカタカナでないと保存できない" do
      
    end
    it "first_name_kanaがカタカナでないと保存できない" do
      
    end
    it "birthdayが空だと保存できない" do
      
    end
  end
end
