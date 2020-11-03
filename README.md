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
 has_many:prefectures

## items テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| name             | string     | null:false                   |
| description      | text       | null:false                   |
| category_id      | integer    | null:false                   |
| condition_id     | integer    | null:false                   |
| delivery_fee_id  | integer    | null:false                   |
| ship_form_id     | integer    | null:false                   |
| days_id          | integer    | null:false                   | 
| price            | integer    | null:false                   |
| user             | references | null:false, foreign_key: true|

association
 belongs_to:user
 has_one:prefecture

## addresses テーブル

| Column        | Type      | Options       |
| ------------- | --------- | ------------- |
| postal_cord   | string    | null:false    |
| prefectures   | integer   | null:false    |
| city_id       | string    | null:false    |
| address       | string    | null:false    |
| building_name | string    | null:false    |
| phone_number  | string    | null:false    |

association
 belongs_to:prefecture

## prefectures テーブル
| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null:false, foreign_key: true |
| item   | references | null:false, foreign_key: true |

association
 belongs_to:user
 belongs_to:item
 has_one:address