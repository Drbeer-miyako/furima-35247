# README

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nick_name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| name     | text   | null: false |
|family_name| text   | null: false |
| name_kana | text   | null: false |
| family_name_kana | text   | null: false |
| birth_date |  date  | null: false |

### Association
- has_many :item
- has_one :order
- has_one :delivery_address


## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
|description| text| null: false |
|category| text   | null: false |
|status  | text   | null: false |
|delivery_charge| text | null: false|
|regional_delivery|text| null: false|
|delivery_date_indication|text| null: false|
|price   | integer     | null: false|
| image    | ActiveStorage       |
| user     | references          |

### Association
- belongs_to :user
- has_one :order






## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
|items   | references | null: false, foreign_key: true |
| address| references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :delivery_address



## delivery_address テーブル
| Column         | Type    | Options     |
| -------------  | ------- | null: false |
| credit_card    | integer | null: false |
| expiration_date| integer | null: false |
| security_code  | integer | null: false |
|                |         |             |
| address        | string  | null: false |
| prefecture     | string  | null: false |
| city           | string  | null: false |
| block          | string  | null: false | 
| building       | string  | null: false |
| telephone      | string  | null: false |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :delivery_address
