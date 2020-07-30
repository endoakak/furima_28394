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


# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nick_name       | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association
- has_many :items
- has_many :deals

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| text          | text    | null: false |
| category      | string  | null: false |
| condition     | string  | null: false |
| delivery_fee  | string  | null: false |
| delivery_from | string  | null: false |
| delivery_days | date    | null: false |
| price         | integer | null: false |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :deal

## deals テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| card_number   | integer | null: false |
| card_expiration_date | integer | null: false |
| card_code     | integer | null: false |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipment

## shipments テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| post_code    | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| address      | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |
| deal_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :deal
