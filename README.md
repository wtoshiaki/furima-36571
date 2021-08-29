# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| password_confiramation| string | null: false |
| first_name            | string | null: false |
| fist_name kana        |string  | null: false |
| family_name           | string | null: false |
| family_name kana      | string | null: false |
| birthday date         | string | null: false |

  
### Association

-has_many :items
-has_many :order

## items テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| titile             | string     | null: false       |
| text               | text       | null: false       |
| category_id        | refarences | foreign_key: tru  |
| sales              | refarences | foreign_key: true |
| fee                | string     | null: false       |
| prefecter          | text       | null: false       |
| schedaled          | text       | null: false       |
| price              | integer    | null: false       |
| user_id            | refarences | foreign_key: true |

### Association

-belongs_to :user
-has_many :order

## orders テーブル

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| user_id            | references | foreign_key: true |
| items_id           | references | foreign_key: true |

### Association
-belongs_to :user 
-belongs_to :item 
-has_one :addres


## addres テーブル

| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| postal_code           | integer | null: false |
| prefecture            | string | null: false |
| city                  | string | null: false |
| addresses             | string | null: false |
| building              |string  | null: false |
| phone_number          | string | null: false |
| user_id               | string | null: false |
| items_id              | string | null: false |

### Association
-belongs_to :order 
