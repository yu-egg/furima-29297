class Order < ApplicationRecord
  attr_accessor :token
  belongs_to :user_item


  validates  :prefectures_id, numericality: { other_than: 1 }
  
  with_options presence: true do
    validates    :postal_code
    validates    :prefectures_id
    validates    :city
    validates    :address
    validates    :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input '-'"}
    validates    :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Input all number"}
  end
end
