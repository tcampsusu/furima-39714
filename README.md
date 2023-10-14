# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| ------------------   | ------ | ----------- |
| nickname             | string | null: false, unique: true |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false |
| name                 | string | null: false, unique: true |
| name_kana            | string | null: false, unique: true |
| birth_date           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

|     Column              | Type    | Options     |
|     ------              | ------  | ----------- |
| item_image              | text    | null: false |
| item_name               | string  | null: false |
| item_description        | text    | null: false |
| item_category           | string  | null: false |   
| item_condition          | string  | null: false | 
| item_shipping_fee_status| string  | null: false | 
| item_shipping_area      | string  | null: false |
| item_shipping_time      | string  | null: false |
| item_price              | integer  | null: false |
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

## Shipping_address テーブル

| Column            | Type   | Options     |
| ------            | ------  | ----------- |
| post_code         | string  | null: false |
| prefecture        | string  | null: false |
| city              | string  | null: false |
| block             | string  | null: false |   
| building_name     | string  | null: false | 
| phone_no          | integer  | null: false | 
| order             | references | null: false, foreign_key: true |

### Association
- belongs_to :order


