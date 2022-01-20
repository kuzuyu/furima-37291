# DB 設計

## users table
|Column              |Type        |Options                        |
|--------------------|------------|-------------------------------|
| name               |string      |null: false,                   |
| email              |string      |null: false, unique: true      |
| encrypted_password |string      |null: false                    |
| first_name         |string      |null: false                    |
| first_name_kana    |string      |null: false                    |
| family_name        |string      |null: false                    |
| family_name_kana   |string      |null: false                    |
| birth_day          |date        |null: false                    |

### Association
has_many :items
has_many :records

## items table
|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
| item_name          |string      |null: false                     |
| item_information   |text        |null: false                     |
| price              |integer     |null: false                     |
| item_condition_id  |integer     |null: false                     |
| postage_payer_id   |integer     |null: false                     |
| category_id        |integer     |null: false,                    |
| preparation_day_id |integer     |null: false                     |
| area_id            |integer     |null: false                     |
| user               |references  |null: false, foreign_key: true  |

### Association
belongs_to :user
has_one :record

## order table
|Column              |Type        |Options                         |
|--------------------|------------|--------------------------------|
|post_number         |string      |null: false                     |
|area_id             |integer     |null: false                     |
|city                |string      |null: false                     |
|address             |string      |null: false                     |
|building_name       |string      |                                |
|phone_number        |string      |null: false                     |
|record              |references  |null: false, foreign_key: true  |

### Association
belongs_to :record

## records table
|Column            |Type        |Options                         |
|------------------|------------|--------------------------------|
|user              |references  |null: false, foreign_key: true  |
|item              |references  |null: false, foreign_key: true  |

### Association
belongs_to :user
belongs_to :item
has_one :order