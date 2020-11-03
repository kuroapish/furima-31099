# furimaのテーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | not null    |
| e_mail          | string | not null    |
| password        | string | not null    |
| first_name      | string | not null    |
| last_name       | string | not null    |
| first_name_kana | string | not null    |
| last_name_kana  | string | not null    |
| birthday        | date   | not null    |

association
 has_many:items
 has_many:addresses

## items テーブル

| Column           | Type       | Options                     |
| ---------------- | ---------- | --------------------------- |
| name             | string     | not null                    |
| item_description | text       | not null                    |
| item_category    | integer    | not null                    |
| item_condition   | integer    | not null                    |
| delivery_fee     | integer    | not null                    |
| ship_form        | integer    | not null                    |
| days             | integer    | not null                    |
| price            | integer    | not null                    |
| user             | references | not null, foreign_key: true |

association
 belongs_to:user
 has_one:purchase

## addresses テーブル

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| postal_cord   | integer   | not null    |
| prefectures   | integer   | not null    |
| city          | string    | not null    |
| address       | string    | not null    |
| building_name | string    | not null    |
| phone_number  | integer   | not null    |

association
 belongs_to:purchase

## purchases テーブル
| Column | Type       | Options                     |
| ------ | ---------- | --------------------------- |
| user   | references | not null, foreign_key: true |
| item   | references | not null, foreign_key: true |

association
 belongs_to:user
 belongs_to:item
 has_one:address