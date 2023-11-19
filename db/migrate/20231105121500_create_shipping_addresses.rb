class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.string     :post_code,   null: false
      t.integer    :item_shipping_area_id, null: false
      t.string     :city, null: false
      t.string     :block, null: false
      t.string     :building_name
      t.string     :phone_no, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end

