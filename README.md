# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname       |string|null: false|
|email          |string|null: false, unique: true|
|password       |string|null: false|
|first_name     |string|null: false|
|last_name      |string|null: false|
|first_name_kana|string|null: false|
|last_name_kana |string|null: false|

### Association
- has_many :machines, dependent: :destroy
- has_many :stock_parts, dependent: :destroy

## machinesテーブル

|Column|Type|Options|
|------|----|-------|
|machine_name                       |string |null: false, unique: true|
|machine_operating_time_accumulation|integer|null: false|
|addition                           |integer||
|user_id                            |integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :machine_parts, dependent: :destroy

## stock_partsテーブル

|Column|Type|Options|
|------|----|-------|
|stock_parts_name        |string |null: false|
|model                   |string |null: false|
|maker                   |string |null: false|
|stock                   |integer|null: false|
|price                   |integer|null: false|
|stock_parts_details_memo|text   |
|user_id                 |integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :machine_parts, dependent: :destroy

## machine_partsテーブル

|Column|Type|Options|
|------|----|-------|
|number_of_use                            |integer|null: false|
|replacement_frequency_setting            |integer|null: false|
|machine_parts_operating_time_accumulation|integer|null: false|
|machine_parts_details_memo               |text   ||
|exchange_announcement                    |integer|null: false|
|order_announcement                       |integer|null: false|
|replacement_procedure_memo               |text   ||
|machine_id                               |integer|null: false, foreign_key: true|
|stock_part_id                            |integer|null: false, foreign_key: true|

### Association
- belongs_to :machine
- belongs_to :machine_part
- has_one :video, dependent: :destroy
- has_many :images, dependent: :destroy
- has_many :exchange_historys, dependent: :destroy

## videosテーブル

|Column|Type|Options|
|------|----|-------|
|video          |string |null: false|
|machine_part_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :machine_part

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image          |string |null: false|
|machine_part_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :machine_part

## exchange_historiesテーブル

|Column|Type|Options|
|------|----|-------|
|exchange_history|string |null: false|
|machine_part_id |integer|null: false, foreign_key: true|

### Association
- belongs_to :machine_part

## orderingsテーブル

|Column|Type|Options|
|------|----|-------|
|machine_part_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :machine_part
