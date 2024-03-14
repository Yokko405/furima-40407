# テーブル設計

## users テーブル

| Column              | Type   | Options                   | Memo      |
|---------------------|--------|---------------------------|-----------|
| nickname            | string | null: false               | ニックネーム |
| email               | string | null: false, unique: true | メールアドレス |
| encrypted_password  | string | null: false               | パスワード |
| last_name           | string | null: false               | 姓 |
| first_name          | string | null: false               | 名 |
| kana_last_name      | string | null: false               | 姓(カナ) |
| kana_first_name     | string | null: false               | 名(カナ) |
| birthday            | date   | null: false               | 生年月日 |

### Association
- has_many :items
- has_many :purchase_records

## items テーブル

| Column                  | Type    | Options                   | Memo |
|-------------------------|---------|---------------------------|------|
| user                    | references | null: false, foreign_key: true | 出品者のユーザーID、usersテーブルの外部キー |
| name                    | string  | null: false               | 商品名 |
| description             | text    | null: false               | 商品説明 |
| category_id             | integer | null: false               | カテゴリー(アクティブハッシュ) |
| condition_id            | integer | null: false               | 商品の状態(アクティブハッシュ) |
| shipping_fee_payer_id   | integer | null: false               | 配送料の負担(アクティブハッシュ) |
| shipping_origin_id      | integer | null: false               | 配送元の地域(アクティブハッシュ) |
| shipping_days_id        | integer | null: false               | 発送までの日数(アクティブハッシュ) |
| price                   | integer | null: false               | 価格 |

### Association
- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column         | Type       | Options                        | Memo |
|----------------|------------|--------------------------------|------|
| user           | references | null: false, foreign_key: true | 購入者のユーザーID、usersテーブルの外部キー |
| item           | references | null: false, foreign_key: true | 購入された商品ID、itemsテーブルの外部キー |
| order_date     | date       | null: false                    | 注文日 |
| payment_amount | integer    | null: false                    | 支払金額 |
| card_number    | integer    | null: false                    | カード情報 |
| expiration_date| integer    | null: false                    | 有効期限 |
| security_code  | integer    | null: false                    | セキュリティコード |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル

| Column            | Type       | Options                        | Memo |
|-------------------|------------|--------------------------------|------|
| purchase_record   | references | null: false, foreign_key: true | 購入履歴テーブルのID、purchase_recordsテーブルの外部キー |
| postal_code       | string     | null: false                    | 郵便番号 |
| prefecture_id     | integer    | null: false                    | 都道府県(アクティブハッシュ) |
| city              | string     | null: false                    | 市区町村 |
| address_number    | string     | null: false                    | 番地 |
| building_name     | string     |                                | 建物名 |
| phone_number      | string     | null: false                    | 電話番号 |


### Association
- belongs_to :purchase_record