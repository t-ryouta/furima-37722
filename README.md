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
| goods           | string     | null: false                    |
| catch_copy      | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| burden_id       | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
 belongs_to :user
 has_one :delivery


## purchasesテーブル

|Column     |Type        |Options                         |
|-----------|------------|--------------------------------|
| buyer     | references | null: false, foreign_key: true |
| buy_goods | string     | null: false                    |

### Association
 belongs_to :user
 belongs_to :item
 has_one :delivery

## deliveriesテーブル

|Column         |Type     |Options                   |
|---------------|---------|--------------------------|
| post_code     | integer | null: false              |
| prefectures   | string  | null: false              |
| city          | string  | null: false              |
| address       | string  | null: false              |
| building_name | string  |                          |
| phone_number  | integer | null: false              |

### Association
 belongs_to :purchase
