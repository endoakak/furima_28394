# README

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
- has_one :card

## cards テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| card_token      | string     | null: false |
| customer_token  | string     | null: false |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| text          | text    | null: false |
| price         | integer | null: false |
| category_id   | integer | null: false |
| condition_id  | integer | null: false |
| delivery_fee_id | integer | null: false |
| delivery_from_id | integer | null: false |
| delivery_day_id | integer | null: false |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :deal

## deals テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipment

## shipments テーブル

| Column        | Type    | Options     |
| ------------  | ------- | ----------- |
| post_code     | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building      | string  |             |
| phone_number  | string | null: false |
| deal_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :deal
