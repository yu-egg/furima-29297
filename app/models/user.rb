class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :user_items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "を入力してください"}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "を入力してください"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "を入力してください"}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "を入力してください"}
    validates :nickname
    validates :birthday
    validates :password
  
  end
end
