class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string     :postal_code     ,null: false
      t.integer    :prefectures_id  ,null: false
      t.string     :city            ,null: false
      t.string     :address         ,null: false
      t.string     :building
      t.string     :phone_number    ,null: false
      t.references :user_items      ,null: false, foreign_key: true
      t.timestamps
    end
  end
end
