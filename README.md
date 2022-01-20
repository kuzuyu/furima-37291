# DB 設計

## users table
|Column            |Type        |Options        |
|------------------|------------|---------------|
| name             |string      |null: false    |
| email            |string      |null: false    |
| password         |string      |null: false    |

### Association
has_many :items
has_many :order
has_many :records

## items table
|Column            |Type        |Options        |
|------------------|------------|---------------|
| item_name        |string      |null: false    |
| item_information |text        |null: false    |
| item_condition   |integer     |null: false    |
| category         |references  |null: false    |
| price            |string      |null: false    |
| buyer            |references  |null: false    |
| seller           |references  |null: false    |
| need_days        |integer     |null: false    |

### Association
belongs_to :user
belongs_to :records

## order table
|Column            |Type        |Options        |
|------------------|------------|---------------|
|post_number       |integer     |null: false    |
|prefectures       |integer     |null: false    |
|city              |string      |null: false    |
|address           |string      |null: false    |
|building_number   |string      |null: false    |
|building_name     |string      |null: false    |

### Association
belongs_to :user

## records table
|Column            |Type        |Options        |
|first_name        |string      |null: false    |
|first_name_kana   |string      |null: false    |
|family_name       |string      |null: false    |
|family_name_kana  |string      |null: false    |
|phone_number      |integer     |null: false    |
|user              |references  |null: false    |

### Association
belongs_to :user
has_one :items


