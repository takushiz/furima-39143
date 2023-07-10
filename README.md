## Usersテーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| nick_name           | string  | null: false               |
| first_name          | string  | null: false               |
| first_name_kana     | string  | null: false               |
| last_name_kana      | string  | null: false               |
| birthday            | date    | null: false               |

## Association
- has_many :items
- has_many :orders


## Itemsテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| charge_id          | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| delivery_date_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
※イメージはActive Strageで対応

## Association
- belongs_to :user
- has_one :order


## addressesテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| municipalities      | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| tel                 | string     | null: false                    |
| order               | references | null: false, foreign_key: true |

## Association
- belongs_to :order


## ordersテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one    :address