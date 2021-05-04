## users テーブル

| Column      | Type   | Option      |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| first-name  | string | null: false |
| second-name | string | null: false |
| birthday    | string | null: false |

### Association
- has_many :items
- has_many :comments
- has_one  :purchases

## Comment テーブル

| Column | Type   | Option |
| ------ | ------ | ------ |
| text   | text   |        |

### Association
- belongs_to :users
- belongs_to :item

## Items テーブル

| Column              | Type   | Option      |
| ------------------- | ------ | ----------- |
| product             | string | null :false |
| product-description | string | null :false |
| image               |        | null :false |
| price               | text   | null :false |
| fee                 | text   | null :false |
| profit              | text   | null :false |

### Association

- has_many   :contents
- belongs_to :users
- belongs_to :purchases

## Purchases テーブル

| Column        | Type    | Option      |
| ------------- | ------- | ----------- |
| card-number   | integer | null :false |
| card-deadline | integer | null :false |
| security-code | integer | null :false |
| postal-code   | integer | null :false |
| municipality  | string  | null :false |
| address       | integer | null :false |
| building-name | string  |             |
| phone-number  | integer | null :false |

### Association

- has_one :items
- belongs_to :users