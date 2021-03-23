# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password |        | null: false |
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
| category        |               | null: false |
| status          |               | null: false |
| burden          |               | null: false |
| area            |               | null: false |
| days            |               | null: false |
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
| shipping_address |               | null: false |
