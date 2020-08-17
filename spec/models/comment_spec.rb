require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "#create" do
    before do
      @comment = FactoryBot.build(:comment)
    end

    it "情報が揃っていれば保存できる" do
      expect(@comment).to be_valid
    end

    it "コメントが空だと保存できない" do
      @comment.text = ""
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Textを入力してください")
    end
  end
end
