class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+\z/}
  validates :last_name, presence: true, format: { with: /\A[\p{Hiragana}\p{Katakana}\p{Han}]+\z/}
  validates :first_name, presence: true, format: { with: /\A[\p{Hiragana}\p{Katakana}\p{Han}]+\z/}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :birth_date, presence: true
  has_many  :items
  has_many  :orders
end