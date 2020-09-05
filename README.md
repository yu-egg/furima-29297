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

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name(名字)         | string | null: false |
| name(名前)         | string | null: false |
| name(名字フリガナ) | string | null: false |
| name(名前フリガナ) | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| nickname           | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :products
- has_many :user_products

## products テーブル

| Column               | Type        | Options                        |
| -------------------- | ----------- | ------------------------------ |
| user                 | references  | null: false, foreign_key: true |
| price                | integer     | null: false                    |
| text                 | tet         | null: false                    |
| category             | integer     | null: false                    |
| product_status       | integer     | null: false                    |
| presence_of_shipping | integer     | null: false                    |
| shipping_origin      | integer     | null: false                    |
| date_of_shipment     | integer     | null: false                    |

### Association

- belongs_to :user
- has_one    :user_products

## user_product テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| product     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :street_address

## street_address

| Column       | Type    | Options       |
| ------------ | ------- | ------------- |
| postal_code  | integer | null: false   |
| prefectures  | integer | null: false   |
| city         | string  | null: false   |
| address1     | string  | null: false   |
| address2     | string  |               |
| phone_number | integer | null: false   |

### Association

- belongs_to :user_product

