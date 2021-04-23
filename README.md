# README

## users テーブル

| Column          | Type   | Options                      |
| --------        | ------ | -----------                  |
| nick_name       | string | null: false                  |
| email           | string | null: false ,uniqueness: true|
| encrypted_password | string | null: false               |
| first_name_zen  | string | null: false                  |
| family_name_zen | string | null: false                  |
| first_name_kana | string | null: false                  |
| family_name_kana| string   | null: false                |
| birth_date      |  date  | null: false                  |

### Association
- has_many :items
- has_many :orders



## items テーブル

| Column             | Type      | Options     |
| ------             | ------    | ----------- |
| title              | string    | null: false |
|description         | text      | null: false |
|category            | string    | null: false |
|status              | string    | null: false |
|delivery_charge     | string    | null: false |
|prefecture_id       |integer    | null: false |
|delivery_date_indication|string | null: false |
|price               | integer   | null: false | 
| image              | ActiveStorage           |
| user               | references              |

### Association
- belongs_to :user
- has_one :order






## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
|items   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :order



## delivery_address テーブル
| Column         | Type    | Options     |
| -------------  | ------- | null: false |
| address        | string  | null: false |
|prefecture_id       |integer    | null: false |
| city           | string  | null: false |
| block          | string  | null: false | 
| building       | string  |             |
| telephone      | string  | null: false |
| order   | references | null: false, foreign_key: true |

### Association
- belongs_to :order
