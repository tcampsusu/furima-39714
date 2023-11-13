
FactoryBot.define do
  factory :order_address do
    user_id { 1 }
    item_id { 1 }
    post_code { "123-4567" }
    item_shipping_area_id { 2 }
    city { "Example City" }
    block { "Example Block" }
    phone_no { "1234567890" }
    token {"tok_abcdefghijk00000000000000000"}

  end
end
