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
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |
| birthday | string | null: false |

## product テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true |
| image                | string     | null: false                    |
| text                 | string     | null: false                    |
| category             | string     | null: false                    |
| product_status       | string     | null: false                    |
| presence_of_shipping | string     | null: false                    |
| shipping_origin      | string     | null: false                    |
| date_of_shipment     | string     | null: false                    |

## purchase テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| street_address       | string     | null: false                    |
| product_information  | references | null: false, foreign_key: true |
| credit_card          | references | null: false, foreign_key: true |
