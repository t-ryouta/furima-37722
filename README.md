# README

## usersテーブル

|Column              |Type    |Options                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |


### Association
 has_many :items
 has_many :orders

## itemsテーブル

|Column           |Type        |Options                         |
|-----------------|------------|--------------------------------|
| goods           | string     | null: false                    |
| catch_copy      | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| burden_id       | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 has_one :order


## ordersテーブル

|Column |Type        |Options                         |
|-------|------------|--------------------------------|
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 belongs_to :item
 has_one :delivery

## deliveriesテーブル

|Column         |Type        |Options                         |
|---------------|------------|--------------------------------|
| post_code     | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user_item     | references | null: false, foreign_key: true |

### Association
 belongs_to :order
