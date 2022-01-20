# DB 設計

## users table
|Column            |Type        |Options                        |
|------------------|------------|-------------------------------|
| name             |string      |null: false                    |
| email            |string      |null: false                    |
| password         |string      |null: false                    |
| first_name       |string      |null: false                    |
| first_name_kana  |string      |null: false                    |
| family_name      |string      |null: false                    |
| family_name_kana |string      |null: false                    |
| birth_day        |date        |null: false                    |

### Association
has_many :items
has_many :order
has_one :records

## items table
|Column            |Type        |Options                         |
|------------------|------------|--------------------------------|
| item_name        |string      |null: false                     |
| item_information |text        |null: false                     |
| item_condition   |integer     |null: false                     |
| category         |references  |null: false ,foreign_key: true  |
| price            |integer     |null: false                     |
| buyer            |references  |null: false ,foreign_key: true  |
| seller           |references  |null: false ,foreign_key: true  |
| preparation_day  |integer     |null: false                     |

### Association
belongs_to :user
has_one :records

## order table
|Column            |Type        |Options                         |
|------------------|------------|--------------------------------|
|post_number       |string      |null: false                     |
|prefecture_code   |integer     |null: false                     |
|city              |string      |null: false                     |
|address           |string      |null: false                     |
|building_number   |string      |null: false                     |
|building_name     |string      |                                |
|phone_number      |integer     |null: false                     |
|user              |references  |null: false, foreign_key: true  |

### Association
belongs_to :records

## records table
|Column            |Type        |Options                         |
|------------------|------------|--------------------------------|
|user              |references  |null: false, foreign_key: true  |

### Association
belongs_to :user
belongs_to :items
has_one :records
