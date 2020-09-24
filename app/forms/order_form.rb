class OrderForm
  include ActiveModel::Model

  attr_accessor :item_id, :user_id,:token, :postal_code, :prefectures_id, :city, :address, :building, :phone_number

  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :token, presence: true
  validates :postal_code, presence: true
  validates :prefectures_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :building, presence: true
  validates :phone_number, presence: true
 

  def save
    UserItem.create(user_id: user_id, item_id: item_id)
    Order.create(token: token, postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building: building, phone_number: phone_number)
  end
end