class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :presence_of_shipping
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :date_of_shipment
  has_one_attached :image
  has_many :users, through: :user_items
  has_many :user_items

  validates :name, :text, :category, :product_status, :presence_of_shipping, :shipping_origin, :date_of_shipment, :price, presence: true, unless: :was_attached?

  validates  :category_id, :product_status_id, :presence_of_shipping_id, :shipping_origin_id, :date_of_shipment_id, numericality: { other_than: 1 }

  def was_attached?
    self.image.was_attached?
  end
end
