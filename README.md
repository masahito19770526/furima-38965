## Usersテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| nickname            | string     | null: false                    |
| email               | string     | null: false unique:true        |
| encrypted_password  | text       | null: false                    |
| first_name          | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| birth_date          | date       | null: false                    |

### Association
- has_many: seller_items
- has_many: buyers_items
- has_many: comments 
- has_many: purchases 


## Itemsテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| delivery_type_id    | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| delivery_date_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| seller              | references | null: false foreign_key:true   |

### Association
- has_one: purchase
- has_one: user
- has_many: comments  
- belong_to_active_hash :status
- belong_to_active_hash :category
- belong_to_active_hash :delivery_type
- belong_to_active_hash :prefecture
- belong_to_active_hash :delivery_date


## Purchasesテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| item                | references | null: false foreign_key:true   |
| buyer               | references | null: false foreign_key:true   |


### Association
- has_one: item
- has_one: user
- has_one: address  

## Addressesテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| zip_code            | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| block_number        | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |

### Association
- has_one: purchase

## Commentsテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| comment             | text       | null: false                    |
| user                | references | null: false foreign_key:true   |
| item                | references | null: false foreign_key:true   |


### Association
- has_many: users
- has_one: item  


