## users テーブル

| Column              | Type               | Options                  |
| ------------------- | ------------------ | ------------------------ |
| nickname            | string             | null: false              |
| email               | string             | null: false, unique:true |
| encrypted_password  | string             | null: false              |
| family_name         | string             | null: false              |
| first_name          | string             | null: false              |
| family_name_kana    | string             | null: false              |
| first_name_kana     | string             | null: false              |
| birth_day           | date               | null: false              |

### Association

- has_many :buyers
- has_many :items
- has_many :likes
- has_many :comments

##  items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| shipping_id      | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_one :buyer

## buyers　テーブル
 
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
belongs_to: item

## shippings

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| address1       | string     | null: false                    |
| address2       | string     | null: false                    |
| shipping_cost	 | integer    | null: false                    |
| shipping_days  | integer    | null: false                    |
| buyer          | references | null: false, foreign_key: true |

### Association
has_one :item
belongs_to :buyer
belongs_to :user

##  likes テーブル
| Column | Type       | Options                 |
| ------ | ---------- | ----------------------- |
| user   | reference  | null: foreign_key: true |
| item   | text       | null: false             |

### Association

- belongs_to :item
- belongs_to :user

##  comments テーブル
| Column | Type       | Options                 |
| ------ | ---------- | ----------------------- |
| user   | references | null: foreign_key: true |
| item   | references | null: foreign_key: true |
| text   | text       | null: false             |

### Association

- belongs_to :item
- belongs_to :user