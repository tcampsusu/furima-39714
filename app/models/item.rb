class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :item_category
belongs_to :item_condition
belongs_to :item_shipping_fee_status
belongs_to :item_shipping_area
belongs_to :item_shipping_time
belongs_to :user
has_one_attached :image
validates :image, presence: { message: "can't be blank" }
validates :item_name, presence: true
validates :item_description, presence: true
validates :item_category_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
validates :item_condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
validates :item_shipping_fee_status_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
validates :item_shipping_area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
validates :item_shipping_time_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
validates :item_price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/}

end
