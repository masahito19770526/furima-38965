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
| image               | blob       | null: false                    |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category            | string     | null: false                    |
| status              | string     | null: false                    |
| delivery_type       | integer    | null: false                    |
| prefecture          | integer    | null: false                    |
| delivery_date       | integer    | null: false                    |
| price               | integer    | null: false                    |
| seller_id           | references | null: false foreign_key:true   |
| buyer_id            | references | null: false foreign_key:true   |

### Association
- has_one: purchases 
- has_many: comments  
- belong_to_active_hash :category
- belong_to_active_hash :delivery_type
- belong_to_active_hash :prefecture
- belong_to_active_hash :delivery_date
- belong_to :seller, class_name: "User"
- belong_to :buyer, class_name: "User"

## Purchaseテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| item_id             | references | null: false foreign_key:true   |
| buyer_id            | references | null: false foreign_key:true   |


### Association
- has_one: users
- belong_to :buyer, class_name: "User" 

## Addressesテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| zip_code            | string     | null: false                    |
| prefecture          | integer    | null: false                    |
| block_number        | string     | null: false                    |
| building_name       | text       |                                |
| phone_number        | string     | null: false                    |

### Association
- has_one: purchases 

## Commentsテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| comment             | text       | null: false                    |
| user_id             | references | null: false foreign_key:true   |
| item_id             | references | null: false foreign_key:true   |


### Association
- has_many: users
- has_one: items  


