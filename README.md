# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| password_confiramation| string | null: false |
| first_name            | string | null: false |
| fist_name kana        | string | null: false |
| last_name             | string | null: false |
| last_name kana        | string | null: false |
| birthday              | date   | null: false |

  
### Association

-has_many :items
-has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -------------------------------|
| titile             | string     | null: false                    |
| intruduce          | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| fee_id             | integer    | null: false                    |
| shipping_id        | integer    | null: false                    |
| item_prefecture_id | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | refarences | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :order

## orders テーブル

| Column             | Type       | Options                       |         
| ------------------ | ---------- | ----------------------------- |
| user               | references |null: false, foreign_key: true |
| item               | references |null: false, foreign_key: true |

### Association
-belongs_to :user 
-belongs_to :item 
-has_one :addres


## addresses テーブル

| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| postal_code           | string | null: false |
| prefecture_id         | integer| null: false |
| city                  | string | null: false |
| house_number          | string | null: false |
| building              | string | 　　　　　　  |
| phone_number          | string | null: false |


### Association
-belongs_to :order 
