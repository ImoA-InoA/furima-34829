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

- has_many :items
- has_many :product_purchase

## items テーブル

| Column          | Type          | Options     |
| --------------- | ------------- | ----------- |
| product_name    | string        | null: false |
| description     | text          | null: false |
| category        | integer_id    | null: false |
| status          | integer_id    | null: false |
| burden          | integer_id    | null: false |
| area            | integer_id    | null: false |
| days            | integer_id    | null: false |
| price           | integer       | null: false |

### Association

- belongs_to :users
- has_one    :product_purchase

## product_purchase テーブル

| Column           | Type          | Options     |
| ---------------- | ------------- | ----------- |
| user_name        |               | null: false |
| user_item        |               | null: false |

### Association

- has_many :users
- has_many :items

## shipping_add テーブル

| Column           | Type          | Options     |
| ---------------- | ------------- | ----------- |
| postal_code      | integer       | null: false |
| prefectures      | string        | null: false |
| municipality     | string        | null: false |
| address          | string        | null: false |
| building         | string        | null: false |
| phone_number     | integer       | null: false |
