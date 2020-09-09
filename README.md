# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



#テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :products
- has_many :user_products

## products テーブル

| Column                  | Type        | Options                        |
| ----------------------- | ----------- | ------------------------------ |
| user                    | references  | null: false, foreign_key: true |
| name                    | string      | null: false                    |
| price                   | integer     | null: false                    |
| text                    | text        | null: false                    |
| category_id             | integer     | null: false                    |
| product_status_id       | integer     | null: false                    |
| presence_of_shipping_id | integer     | null: false                    |
| shipping_origin_id      | integer     | null: false                    |
| date_of_shipment_id     | integer     | null: false                    |

### Association

- belongs_to :user
- has_one    :user_product

## user_products テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| product     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :street_address

## street_addresses

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefectures_id  | integer    | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| user_product    | references | null: false, foreign_key: true |

### Association

- belongs_to :user_product
