# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :purchases
* System dependencies

## items テーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| name        | string  | null: false                    |
| description | text    | null: false                    |
| categories  | integer | null: false                    |
| state       | integer | null: false                    |
| bearer      | integer | null: false, foreign_key: true |
| area        | integer | null: false, foreign_key: true |
| days        | integer | null: false, foreign_key: true |
| price       | integer | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :adress

## adresses テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| zip_code      | string  | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| street_number | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |

### Association

- belongs_to :purchases