## users テーブル

| Column      | Type   | Option      |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| first-name  | string | null: false |
| second-name | string | null: false |
| birthday    | date   | null: false |

### Association
- has_many :items
- has_one  :purchases

## Items テーブル

| Column              | Type   | Option      |
| ------------------- | ------ | ----------- |
| product             | text   | null :false |
| product-description | text   | null :false |
| price               | text   | null :false |
| fee                 | text   | null :false |
| profit              | text   | null :false |

### Association

- belongs_to :users
- belongs_to :purchases

## Addresses テーブル 

| Column        | Type    | Option      |
| ------------- | ------- | ----------- |
| postal-code   | integer | null :false |
| prefectures   | string  | null :false |
| municipality  | string  | null :false |
| address       | integer | null :false |
| building-name | string  |             |
| phone-number  | integer | null :false |

### Association

- has_one :items
- has_one :purchases
- belongs_to :users

## Purchases テーブル

| Column    | Type   | Option      |
| --------- | ------ | ----------- |
| buyer     | string | null :false |
| purchased | text   | null :false |

### Association

- belongs_to :addresses