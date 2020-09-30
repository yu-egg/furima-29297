class OrderForm
  include ActiveModel::Model

  attr_accessor :item_id, :user_id,:token, :postal_code, :prefectures_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Input '-'"}
    validates :prefectures_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Input all number"}
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "is invalid. Input all number"}
  end

  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building: building, phone_number: phone_number, user_item_id: user_item.id)
  end
end