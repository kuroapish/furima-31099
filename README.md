# furimaのテーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null:false  |
| email             | string | null:false  |
| encrypted_password| string | null:false  |
| first_name        | string | null:false  |
| last_name         | string | null:false  |
| first_name_kana   | string | null:false  |
| last_name_kana    | string | null:false  |
| birthday          | date   | null:false  |

association
 has_many:items
 has_many:purchases

## items テーブル

| Column                       | Type       | Options                      |
| ---------------------------- | ---------- | ---------------------------- |
| name                         | string     | null:false                   |
| description                  | text       | null:false                   |
| category_id(active_hash)     | integer    | null:false                   |
| condition_id(active_hash)    | integer    | null:false                   |
| delivery_fee_id(active_hash) | integer    | null:false                   |
| ship_form_id(active_hash)    | integer    | null:false                   |
| days_id(active_hash)         | integer    | null:false                   | 
| price                        | integer    | null:false                   |
| user                         | references | null:false, foreign_key: true|
category_id(active_hash)
condition_id(active_hash)


association
 belongs_to:user
 has_one:purchase

## addresses テーブル

| Column        | Type      | Options                      |
| ------------- | --------- | ---------------------------- |
| postal_cord   | string    | null:false                   |
| prefectures_id| integer   | null:false                   |
| city          | string    | null:false                   |
| address       | string    | null:false                   |
| building_name | string    |                              |
| phone_number  | string    | null:false                   |
| purchase      | references| null:false, foreign_key: true|


association
 belongs_to:purchase

## purchases テーブル
| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null:false, foreign_key: true |
| item   | references | null:false, foreign_key: true |

association
 belongs_to:user
 belongs_to:item
 has_one:address