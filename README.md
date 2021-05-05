## users テーブル

| Column                | Type    | Option                    |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| first-name            | string  | null: false               |
| second-name           | string  | null: false               |
| birthday              | date    | null: false               |
| encrypted_password    | string  | null: false               |
| first-name,kana       | string  | null: false               |
| second-name,kana      | string  | null: false               |


### Association
- has_many :items
- has_many :purchases

## Items テーブル

| Column              | Type       | Option            |
| ------------------- | -------    | ----------------- |
| product             | string     | null :false       |
| product-description | text       | null :false       |
| category            | references | foreign_key: true |
| product-status      | references | foreign_key: true |
| delivery-charge     | references | foreign_key: true |
| shipment            | references | foreign_key: true |
| shipping-days       | references | foreign_key: true |
| price               | integer    | null :false       |

### Association

- belongs_to :user
- has_one    :purchases

## Addresses テーブル 

| Column        | Type     | Option      |
| ------------- | -------- | ----------- |
| postal-code   | string   | null :false |
| prefectures   | integer  | null :false |
| municipality  | string   | null :false |
| address       | string   | null :false |
| building-name | string   |             |
| phone-number  | string   | null :false |

### Association

- belongs_to :purchases

## Purchases テーブル

| Column    | Type       | Option            |
| --------- | ---------- | ----------------- |
| buyer     | references | foreign_key: true |
| purchased | references | foreign_key: true |

### Association

- has_one :address
- belongs_to :item
- belongs_to :user
