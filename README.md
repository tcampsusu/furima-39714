# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_name_kana       | string | null: false |
| first_name_kana      | string | null: false |
| birth_date           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

|     Column                 | Type    | Options     |
|     ------                 | ------  | ----------- |
| item_name                  | string  | null: false |
| item_description           | text    | null: false |
| item_category_id           | integer | null: false |   
| item_condition_id          | integer | null: false | 
| item_shipping_fee_status_id| integer | null: false | 
| item_shipping_area_id      | integer | null: false |
| item_shipping_time_id      | integer | null: false |
| item_price                 | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association

- has_one : order
- belongs_to :user

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :shipping_address

## Shipping_addresses テーブル

| Column                | Type    | Options     |
| ------                | ------  | ----------- |
| post_code             | string  | null: false |
| item_shipping_area_id | integer | null: false |
| city                  | string  | null: false |
| block                 | string  | null: false |   
| building_name         | string  | 
| phone_no              | string | null: false | 
| order                 | references | null: false, foreign_key: true |

### Association
- belongs_to :order


