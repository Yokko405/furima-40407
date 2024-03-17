class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[^\x20-\x7E｡-ﾟ]+\z/, message: 'は全角文字で入力してください。' }
  validates :first_name, presence: true, format: { with: /\A[^\x20-\x7E｡-ﾟ]+\z/, message: 'は全角文字で入力してください。' }
  validates :kana_last_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください。' }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください。' }
  validates :birthday, presence: true

  # 半角英数字混合のバリデーション
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください。' }

  # has_many :items
end
