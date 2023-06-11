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
- belongs_to: user
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
- belongs_to: item
- belongs_to: user
- has_one: address  


## Addressesテーブル

| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| zip_code            | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| block_number        | string     | null: false                    |
| building_name       | string     | foreign_key:true               |
| phone_number        | string     | null: false unique:true        |
| purchase            | references | null: false foreign_key:true   |

### Association
- belongs_to: purchase




