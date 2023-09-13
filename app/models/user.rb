class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください'

  validates :nickname, presence: true

  with_options presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :family_name
    validates :first_name
  end

  KATAKANA_REGEXP = /\A[\p{Katakana}\u{30fc}]+\z/
  validates :family_name_kana, presence: true, format: { with: KATAKANA_REGEXP }
  validates :first_name_kana, presence: true, format: { with: KATAKANA_REGEXP }

  validates :birth_day, presence: true

  # has_many :orders
  # has_many :items
  # has_many :likes
  # has_many :comments
end