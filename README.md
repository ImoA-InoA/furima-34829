# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| birthday | string | null: false |

### Association

- has_many :items
- has_one  :product_purchase

## items テーブル

| Column          | Type          | Options     |
| --------------- | ------------- | ----------- |
| image           | ActiveStorage |             |
| product_name    | string        | null: false |
| description     | text          | null: false |
| delivery        | text          | null: false |
| price           |               | null: false |

### Association

- belongs_to :users
- has_one    :product_purchase

## product_purchase テーブル

| Column           | Type          | Options     |
| ---------------- | ------------- | ----------- |
| purchase_details |               |             |
| credit_card      |               | null: false |
| shipping_add     |               | null: false |

### Association

- belongs_to :users
- belongs_to :items