
class OrderAddress
 include ActiveModel::Model
 attr_accessor :user_id, :item_id, :post_code, :item_shipping_area_id, :city, :block, :building_name, :phone_no, :token

 with_options presence: true do
  validates :user_id
  validates :item_id
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  validates :city
  validates :block
  validates :phone_no, presence: true, length: { minimum: 10, maximum: 11,message: "is too short" },format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
 end
 validates :item_shipping_area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
 validates :token, presence: true

 def save
  order = Order.create(user_id: user_id, item_id: item_id)

  ShippingAddress.create(post_code: post_code, item_shipping_area_id: item_shipping_area_id, city: city, block: block, building_name: building_name, phone_no: phone_no, order_id: order.id)
end

end