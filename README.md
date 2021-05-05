## users テーブル

| Column      | Type    | Option      |
| ----------- | ------- | ----------- |
| nickname    | string  | null: false |
| email       | string  | null: false |
| first-name  | string  | null: false |
| second-name | string  | null: false |
| birthday    | date    | null: false |
| password    | integer | null: false |
| surname     | string  | null: false |
| name        | string  | null: false |


### Association
- has_many :items
- has_many :purchases

## Items テーブル

| Column              | Type    | Option      |
| ------------------- | ------- | ----------- |
| product             | string  | null :false |
| product-description | text    | null :false |
| price               | integer | null :false |

### Association

- belongs_to :user
- belongs_to :purchase

## Addresses テーブル 

| Column        | Type    | Option      |
| ------------- | ------- | ----------- |
| postal-code   | string  | null :false |
| prefectures   | string  | null :false |
| municipality  | string  | null :false |
| address       | integer | null :false |
| building-name | string  |             |
| phone-number  | string  | null :false |

### Association

- has_one :items
- has_one :purchases
- belongs_to :user

## Purchases テーブル

| Column    | Type       | Option            |
| --------- | ---------- | ----------------- |
| buyer     | references | foreign_key: true |
| purchased | references | foreign_key: true |

### Association

- belongs_to :address