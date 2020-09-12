class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
    
      t.string     :name,                    null:false
      t.text       :text,                    null:false
      t.references :user,                    null:false, foreign_key: true
      t.integer    :category_id,             null:false
      t.integer    :product_status_id ,      null:false
      t.integer    :presence_of_shipping_id, null:false
      t.integer    :shipping_origin_id,      null:false
      t.integer    :date_of_shipment_id,     null:false
      t.integer    :price,                   null:false
      t.timestamps
    end
  end
end
