class Order < ApplicationRecord
  attr_accessor :token
  has_one :user_item
  

  validates    :postal_code,    presence: true
  validates    :prefectures_id, presence: true
  validates    :city,           presence: true
  validates    :address,        presence: true
  validates    :phone_number,   presence: true
end
