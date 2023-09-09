## users テーブル

| Column              | Type               | Options                  |
| ------------------- | ------------------ | ------------------------ |
| nickname            | string             | null: false              |
| email               | string             | null: false, unique:true |
| encrypted_password | string             | null: false              |
| family_name         | string             | null: false              |
| first_name          | string             | null: false              |
| family_name_kana    | string             | null: false              |
| first_name_kana     | string             | null: false              |
| birth_day           | date               | null: false              |

### Association

- has_many :buyers
- has_many :items
- has_many :likes dependent: :destroy
- has_many :comments dependent: :destroy

##  items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| explanation      | text       | null: false                    |
| category_id      | integer    | null: false, foreign_key: true |
| condition_id     | integer    | null: false, foreign_key: true |
| shipping_id      | integer    | null: false, foreign_key: true |
| prefecture_id    | integer    | null: false, foreign_key: true |
| shipping_days_id | integer    | null: false, foreign_key: true |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_one :buyer

## buyers　テーブル
 
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| buyer_name     | string     | null: false                    |
| created_at     | date       | null: false                    |
| updated_at     | date       | null: false                    |

### Association
has_one: item

## shippings

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| address1       | text       | null: false                    |
| address2       | text       | null: false                    |
| buyer_id       | references | null: false, foreign_key: true |

### Association
has_one :item
belongs_to :buyer
belongs_to :user

##  likes テーブル
| Column    | Type       | Options               |
| --------- | ---------- | --------------------- |
| user_id   | string     | null: false           |
| item_id   | text       | null: false           |

### Association

- belongs_to :item
- belongs_to :user

##  comments テーブル
| Column    | Type       | Options                 |
| --------- | ---------- | ----------------------- |
| user_id   | references | null: foreign_key: true |
| item_id   | references | null: foreign_key: true |
| text      | text       | null: false             |

### Association

- belongs_to :item
- belongs_to :user