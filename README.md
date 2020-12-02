# テーブル設計

## users テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| nickname           | string     | null: false                   |
| email              | string     | null: false unique: true      |
| encrypted_password | string     | null: false                   |
| last_name          | string     | null: false                   |
| first_name         | string     | null: false                   |
| last_name(kana)    | string     | null: false                   |
| first_name(kana)   | string     | null: false                   |
| birthday           | date       | null: false                   |


### Association

- has_many   :items
- has_many   ;user_items



## items テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| item_name        | string     | null: false                   |
| explanation      | text       | null: false                   |
| category         | string     | null: false                   |
| status           | string     | null: false                   |
| delivery_fee     | string     | null: false                   |
| shipper          | string     | null: false                   |
| delivery_day     | string     | null: false                   |
| price            | integer    | null: false                   |
| user_id          | references | null: false foreign_key: true |


### Association

- belongs_to :users
- has_one    :user_items
- 



## user_items テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| user_id          | references | null: false foreign_key: true |
| item_id          | references | null: false foreign_key: true |


### Association

- belongs_to :users
- belongs_to :items



<!-- 
## address テーブル

| Column           | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| post_code        | string     | null: false                   |
| prefecture       | string     | null: false                   |
| city             | string     | null: false                   |
| address          | string     | null: false                   |
| building         | string     | null: false                   |
| tel_num          | integer    | null: false                   |

### Association

- belongs_to :users
-  -->




<!-- 


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :prototypes -->
