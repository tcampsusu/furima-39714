class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string  :item_name, null: false
      t.text    :item_description, null: false
      t.integer :item_category_id, null: false
      t.integer :item_condition_id, null: false
      t.integer :item_shipping_fee_status_id, null: false
      t.integer :item_shipping_area_id, null: false
      t.integer :item_shipping_time_id, null: false
      t.integer :item_price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
