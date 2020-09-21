class Order < ApplicationRecord
  has_one :user_item
  has_one :item

  validates    :postal_code,    presence: true
  validates    :prefectures_id, presence: true
  validatest   :city,           presence: true
  validatest   :address,        presence: true
  validatest   :building
  validatest   :phone_number,   presence: true
  validatest   :user_items
end
