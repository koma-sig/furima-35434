## users テーブル

| Column             | Type    | Option                    |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| first_name         | string  | null: false               |
| second_name        | string  | null: false               |
| birthday           | date    | null: false               |
| encrypted_password | string  | null: false               |
| first_name_kana    | string  | null: false               |
| second_name_kana   | string  | null: false               |


### Association
- has_many :items
- has_many :purchases

## Items テーブル

| Column              | Type       | Option            |
| ------------------- | ---------- | ----------------- |
| product             | string     | null :false       |
| product_description | text       | null :false       |
| category_id         | integer    | null :false       |
| product_status_id   | integer    | null :false       |
| delivery_charge_id  | integer    | null :false       |
| shipment_id         | integer    | null :false       |
| shipping_days_id    | integer    | null :false       |
| price               | integer    | null :false       |
| user                | references | foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchase

## Addresses テーブル 

| Column        | Type       | Option            |
| ------------- | ---------- | ----------------- |
| postal-code   | string     | null :false       |
| shipment_id   | integer    | null :false       |
| municipality  | string     | null :false       |
| address       | string     | null :false       |
| building-name | string     |                   |
| phone-number  | string     | null :false       |
| purchase      | references | foreign_key: true |

### Association

- belongs_to :purchases

## Purchases テーブル

| Column    | Type       | Option            |
| --------- | ---------- | ----------------- |
| buyer     | references | foreign_key: true |
| purchased | references | foreign_key: true |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association

- has_one :address
- belongs_to :item
- belongs_to :user
