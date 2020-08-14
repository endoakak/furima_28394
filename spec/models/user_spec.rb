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
      @user.nick_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it "emailが空だと保存できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it "emailが被っていると保存できない" do
      user = FactoryBot.create(:user)
      @user.email = user.email
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it "emailに@がないと保存できない" do
      @user.email = "sample.mail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it "passwordが空だと保存できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "passwordが6文字以上でないと保存できない" do
      pass = "a0000"
      @user.password = pass
      @user.password_confirmation = pass
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it "passwordが6文字以上のとき保存できる" do
      pass = "a00000"
      @user.password = pass
      @user.password_confirmation = pass
      expect(@user).to be_valid
    end

    it "passwordが英数字混合でないと保存できない" do
      pass = "000000"
      @user.password = pass
      @user.password_confirmation = pass
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは英数字混合で入力してください")
    end

    it "passwordの確認が正しくないと保存できない" do
      @user.password_confirmation = "a00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "last_nameが空だと保存できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("姓を入力してください")
    end

    it "first_nameが空だと保存できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end

    it "last_nameが全角でないと保存できない" do
      @user.last_name = "lastname"
      @user.valid?
      expect(@user.errors.full_messages).to include("姓には全角文字を使用してください")
    end

    it "first_nameが全角でないと保存できない" do
      @user.first_name = "firstname"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前には全角文字を使用してください")
    end

    it "last_name_kanaが空だと保存できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("姓のフリガナを入力してください")
    end

    it "first_name_kanaが空だと保存できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名前のフリガナを入力してください")
    end

    it "last_name_kanaがカタカナでないと保存できない" do
      @user.last_name_kana = "lastname"
      @user.valid?
      expect(@user.errors.full_messages).to include("姓のフリガナにはカタカナを使用してください")
    end

    it "first_name_kanaがカタカナでないと保存できない" do
      @user.first_name_kana = "firstname"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前のフリガナにはカタカナを使用してください")
    end

    it "birthdayが空だと保存できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end
