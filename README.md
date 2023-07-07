## Usersテーブル

| Column              | Type    | Options                |
| ------------------- | ------- | ---------------------- |
| email               | string  | null: false ユニーク制約 |
| encrypted_password  | string  | null: false            |
| nick_name           | string  | null: false            |
| first_name          | string  | null: false            |
| first_name_kana     | string  | null: false            |
| last_name_kana      | string  | null: false            |
| birthyear           | integer | null: false            |
| birthmonth          | integer | null: false            |
| birthday            | integer | null: false            |

## Association
- has_many :items
- has_many :orders


## Itemsテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category            | string     | null: false                    |
| condition           | string     | null: false                    |
| delivery_charges    | string     | null: false                    |
| delivery_origin     | string     | null: false                    |
| delivery_date       | string     | null: false                    |
| price               | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |
※イメージはActive Strageで対応

## Association
- belongs_to :user
- has_one :order
- has_one :address


## addressesテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | integer    | null: false                    |
| prefecture          | string     | null: false                    |
| municipalities      | string     | null: false                    |
| house_number        | integer    | null: false                    |
| building_name       | string     | null: false                    |
| tel                 | integer    | null: false                    |
| item_id             | references | null: false, foreign_key: true |

## Association
- belongs_to :item


## ordersテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| order_date          | timestamp  | null: false                    |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item