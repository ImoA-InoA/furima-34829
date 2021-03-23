# テーブル設計

## users テーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false, foreign_key: true |
| email              | string | null: false, unique: true      |
| encrypted_password | string | null: false, foreign_key: true |
| last_name          | string | null: false, foreign_key: true |
| first_name         | string | null: false, foreign_key: true |
| last_name_kana     | string | null: false, foreign_key: true |
| first_name_kana    | string | null: false, foreign_key: true |
| birthday           | date   | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :product_purchases

## items テーブル

| Column          | Type          | Options     |
| --------------- | ------------- | ----------- |
| product_name    | string        | null: false |
| description     | text          | null: false |
| category_id     | integer       | null: false |
| status_id       | integer       | null: false |
| burden_id       | integer       | null: false |
| area_id         | integer       | null: false |
| delivery_id     | integer       | null: false |
| price           | integer       | null: false |

### Association

- belongs_to :user
- has_one    :product_purchase

## product_purchase テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| item             | references    | null: false, foreign_key: true |
| user             | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_add

## shipping_add テーブル

| Column           | Type          | Options                         |
| ---------------- | ------------- | ------------------------------- |
| postal_code      | string        | null: false, foreign_key: true  |
| area_id          | integer       | null: false, foreign_key: true  |
| municipality     | string        | null: false, foreign_key: true  |
| address          | string        | null: false, foreign_key: true  |
| building         | string        | foreign_key: true               |
| phone_number     | string        | null: false, foreign_key: true  |

### Association

- belongs_to :product_purchase
