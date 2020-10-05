class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :presence_of_shipping
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :date_of_shipment
  has_one_attached :image
  belongs_to :user
  has_one :user_item


  validates  :category_id, :product_status_id, :presence_of_shipping_id, :shipping_origin_id, :date_of_shipment_id, numericality: { other_than: 1 }


  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/, message: "は、全て半角数字で入力してください"}
    validates :price, numericality: { greater_than_or_equal_to: 300}
    validates :price, numericality: { less_than_or_equal_to: 9_999_999}
    validates :image
    validates :name
    validates :text
    validates :category_id
    validates :product_status_id
    validates :presence_of_shipping_id
    validates :shipping_origin_id
    validates :date_of_shipment_id
    validates :price
    
  end
end
