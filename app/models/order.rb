class Order < ApplicationRecord
  belongs_to :user_item
  validates  :prefectures_id, numericality: { other_than: 1 }
end
