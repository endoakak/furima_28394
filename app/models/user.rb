class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nick_name
    validates :birthday
  end

  PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/.freeze
  validates :password, format: { with: PASSWORD_REGEX, message: "パスワードは英数字混合で入力してください" }

  ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  with_options presence: true, format: { with: ZENKAKU_REGEX, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  KATAKANA_REGEX = /\A[ァ-ン]+\z/.freeze
  with_options presence: true, format: { with: KATAKANA_REGEX, message: 'カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
  has_many :items
  has_many :deals
end
