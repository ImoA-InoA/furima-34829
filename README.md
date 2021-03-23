# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items, foreign_key: true
- has_many :product_purchase, foreign_key: true

## items テーブル

| Column          | Type          | Options     |
| --------------- | ------------- | ----------- |
| product_name    | string        | null: false |
| description     | text          | null: false |
| category_id     | integer       | null: false |
| status_id       | integer       | null: false |
| burden_id       | integer       | null: false |
| area_id         | integer       | null: false |
| days_id         | integer       | null: false |
| price           | integer       | null: false |

### Association

- belongs_to :users
- has_one    :product_purchase, foreign_key: true

## product_purchase テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| user_name        |               | null: false, foreign_key: true |
| user_item        |               | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## shipping_add テーブル

| Column           | Type          | Options     |
| ---------------- | ------------- | ----------- |
| postal_code      | string        | null: false |
| area_id          | integer       | null: false |
| municipality     | string        | null: false |
| address          | string        | null: false |
| building         | string        |             |
| phone_number     | string        | null: false |
