class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }         

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
  
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true

  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
  validates :family_name_kana, presence: true, format: { :with KATAKANA_REGEXP }
  validates :first_name_kana, presence: true, format: { :with KATAKANA_REGEXP }

  validates :birth_day, presence: true

  has_many :orders
  has_many :items
  has_many :likes
  has_many :comments

end