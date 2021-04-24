# README

## users テーブル

| Column          | Type   | Options                      |
| --------        | ------ | -----------                  |
| nick_name       | string | null: false                  |
| email           | string | null: false ,unique: true    |
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
 
| Column                    | Type       | Options     |
| ------                    | ------     | ----------- |
| title                     | string     | null: false |
|description                | text       | null: false |
|category_id                | integer    | null: false |
|status_id                  | integer    | null: false |
|delivery_charge_id         | integer    | null: false |
|prefecture_id              | integer    | null: false |
|delivery_date_indication_id| integer    | null: false |
|price                      | integer    | null: false | 
| user                      | references | foreign_key: true |

### Association
- belongs_to :user
- has_one :order






## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
|item   | references | null: false, foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery_address



## delivery_addresses テーブル
| Column         | Type    | Options     |
| -------------  | ------- | -------     |
| address        | string  | null: false |
|prefecture_id       |integer    | null: false |
| city           | string  | null: false |
| block          | string  | null: false | 
| building       | string  |             |
| telephone      | string  | null: false |
| order   | references | null: false, foreign_key: true |

### Association
- belongs_to :order
