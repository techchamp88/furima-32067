# テーブル設計

## users テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| nickname           | string     | null: false                   |
| email              | string     | null: false unique: true      |
| encrypted_password | string     | null: false                   |
| last_name          | string     | null: false                   |
| first_name         | string     | null: false                   |
| last_name_kana     | string     | null: false                   |
| first_name_kana    | string     | null: false                   |
| birthday           | date       | null: false                   |


### Association

- has_many   :items
- has_many   :user_items



## items テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| name             | string     | null: false                   |
| explanation      | text       | null: false                   |
| category_id      | integer    | null: false                   |
| status_id        | integer    | null: false                   |
| delivery_fee_id  | integer    | null: false                   |
| shipper_id       | integer    | null: false                   |
| delivery_day_id  | integer    | null: false                   |
| price            | integer    | null: false                   |
| user             | references | null: false foreign_key: true |


### Association

- belongs_to :user
- has_one    :user_item
- 



## user_items テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| user             | references | null: false foreign_key: true |
| item             | references | null: false foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item




## address テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| post_code        | string     | null: false                   |
| shipper_id    | integer    | null: false                   |
| city             | string     | null: false                   |
| address          | string     | null: false                   |
| building         | string     |                               |
| tel_num          | string     | null: false                   |
| user_item        | references | null: false foreign_key: true |

### Association

- belongs_to :user_item
-  







## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item


ALTER TABLE address CHANGE prefecture_id shipper_id integer;  