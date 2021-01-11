# テーブル設計

## usersテーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| state_id              | integer | null: false               |

### Association

- has_many :products
- has_many :comments


# productsテーブル

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| product_name          | string     | null: false                     |
| brand                 | string     | null: false                     |
| origin_id             | integer    | null: false                     |
| text                  | text       | null: false                     |
| user                  | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_many :comments


# commentsテーブル

| Column                | Type       | Options                         |
| --------------------- | ---------- | ------------------------------- |
| text                  | text       | null: false                     |
| user                  | references | null: false, foreign_key: true  |
| product               | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :product