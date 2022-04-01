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
 has_many :purchases

## itemsテーブル

|Column           |Type        |Options                         |
|-----------------|------------|--------------------------------|
| goods           | strings    | null: false                    |
| catch_copy      | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| burden_id       | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |

### Association
 belongs_to :user
 has_one :user_items


## user_itemsテーブル

|Column |Type        |Options                         |
|-------|------------|--------------------------------|
| user  | references | null: false, foreign_key: true |
| goods | references | null: false, foreign_key: true |

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

### Association
 belongs_to :user_items
