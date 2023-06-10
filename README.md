## Usersテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| nickname            | string     | null: false                    |
| email               | string     | null: false unique:true        |
| encrypted_password  | string     | null: false                    |
| first_name          | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| birth_date          | date       | null: false                    |

### Association
- has_many: items
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
| user                | references | null: false foreign_key:true   |

### Association
- has_one: purchase
- has_many: comments  
- belongs-to: user
- belongs_to_active_hash :status
- belongs_to_active_hash :category
- belongs_to_active_hash :delivery_type
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :delivery_date


## Purchasesテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| item                | references | null: false foreign_key:true   |
| user                | references | null: false foreign_key:true   |


### Association
- belongs-to: item
- belongs-to: user
- has_one: address  


## Addressesテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| zip_code            | integer    | null: false foreign_key:true   |
| prefecture_id       | integer    | null: false foreign_key:true   |
| city                | string     | null: false foreign_key:true   |
| block_number        | string     | null: false foreign_key:true   |
| building_name       | string     | foreign_key:true               |
| phone_number        | integer    | null: false foreign_key:true   |

### Association
- belongs_to: purchase

## Commentsテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| comment             | text       | null: false                    |
| user                | references | null: false foreign_key:true   |
| item                | references | null: false foreign_key:true   |


### Association
- has_many: users
- belongs_to: item  


