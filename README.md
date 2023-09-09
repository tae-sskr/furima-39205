## users テーブル

| Column             | Type               | Options                  |
| ------------------ | ------------------ | ------------------------ |
| nickname           | string¥null: false | null: false              |
| email              | string             | null: false, unique:true |
| password           | string             | null: false              |
| family_name        | string             | null: false              |
| first_name         | string             | null: false              |
| family_name_kana   | string             | null: false              |
| first_name_kana    | string             | null: false              |
| birth_year         | string             | null: false              |
| birth_month        | string             | null: false              |
| birth_day          | string             | null: false              |
| status             | integer            | null: false              |

### Association

- has_many :items
- has_many :likes dependent: :destroy
- has_many :comments dependent: :destroy

##  items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| explanation   | text       | null: false                    |
| category_id   | references | null: false, foreign_key: true |
| condition_id  | references | null: false, foreign_key: true |
| shipping_id   | references | null: false, foreign_key: true |
| prefecture_id | references | null: false, foreign_key: true |
| shipping_days_id| references | null: false, foreign_key: true |
| price         | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_one :buyer

##  Buyer テーブル
 
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| buyer_name     | string     | null: false                    |
| postal_code    | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| address1       | text       | null: false                    |
| address2       | text       | null: false                    |
| postage        | integer    | null: false                    |
| billing_amount | integer    | null: false                    |
| status         | text       | null: false                    |
| created_at     | date       | null: false                    |
| updated_at     | date       | null: false                    |


### Association
has_one: item

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
| user_id   | string     | null: foreign_key: true |
| item_id   | string     | null: foreign_key: true |
| text      | text       | null: false             |

### Association

- belongs_to :item
- belongs_to :user