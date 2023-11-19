
FactoryBot.define do
  factory :order_address do
    post_code { "123-4567" }
    item_shipping_area_id { 2 }
    city { "Example City" }
    block { "Example Block" }
    phone_no { "1234567890" }
    building_name { "leopalace" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
