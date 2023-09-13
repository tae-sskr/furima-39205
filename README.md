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

- has_many :orders
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
| schedule_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_one :order

## orders　テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
belongs_to :item
belongs_to :user
has_one :shipping

## shippings

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| address1       | string     | null: false                    |
| address2       | string     | null: false                    |
| building_name	 | string     | null: false                    |
| telephone      | integer    | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

belongs_to :order

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