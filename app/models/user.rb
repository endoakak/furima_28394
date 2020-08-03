class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nick_name, presence: true
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/, message: "パスワードは英数字混合で入力してください" }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
