# README

# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| nickname        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many : items
- has_many : orders

## items テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| name               | text       | null: false       |
| description        | text       | null: false       |
| genre_id           | integer    | null: false       |
| status_id          | integer    | null: false       |
| ship_burden_id     | integer    | null: false       |
| shipment_source_id | integer    | null: false       |
| days_to_id         | integer    | null: false       |
| price              | integer    | null: false       |
| user               | references | foreign_key: true |
|                    |            | null: false       |

### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :genre
- belongs_to_active_hash :status
- belongs_to_active_hash :ship_burden
- belongs_to_active_hash :shipment_source
- belongs_to_active_hash :days_to

## orders テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| item    | references | foreign_key: true |
|         |            | null: false       |
| user    | references | foreign_key: true |
|         |            | null: false       |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column                  | Type       | Options            |
| ----------------------- | ---------- | ------------------ |
| postal_code             | string     | null: false        |
| ship_region_id          | integer    | null: false        |
| ship_city               | string     | null: false        |
| ship_block              | string     | null: false        |
| ship_building           | string     |                    |
| phone                   | string     | null: false        |
| order                   | references | foreign_key: true  |
|                         |            | null: false        |

### Association

- belongs_to :order
- belongs_to_active_hash :ship_region