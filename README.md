# テーブル設計

## users テーブル

| Column         | Type   | Options     | memo      |
|----------------|--------|-------------|-----------|
| nickname       | string | null: false | ニックネーム |
| email          | string | null: false | メールアドレス |
| password_digest| string | null: false | パスワード   |
| last_name      | string | null: false | 姓        |
| first_name     | string | null: false | 名        |
| kana_last_name | string | null: false | 姓(カナ)   |
| kana_first_name| string | null: false | 名(カナ)   |
| birthday       | date   | null: false | 生年月日   |

## items テーブル

| Column              | Type       | Options                        | memo                                 |
|---------------------|------------|--------------------------------|--------------------------------------|
| user_id             | references | null: false, foreign_key: true | 出品者のユーザーID、usersテーブルの外部キー |
| image               | image      | null: false                    | 商品画像                             |
| name                | string     | null: false                    | 商品名                               |
| description         | text       | null: false                    | 商品説明                             |
| category            | string     | null: false                    | カテゴリー                           |
| condition           | string     | null: false                    | 商品の状態                           |
| shipping_fee_payer  | string     | null: false                    | 配送料の負担                         |
| shipping_origin     | string     | null: false                    | 配送元の地域                         |
| shipping_days       | integer    | null: false                    | 発送までの日数                       |
| price               | integer    | null: false                    | 価格                                 |

## orders テーブル

| Column             | Type       | Options                        | memo                                 |
|--------------------|------------|--------------------------------|--------------------------------------|
| user_id            | references | null: false, foreign_key: true | 購入者のユーザーID、usersテーブルの外部キー |
| item_id            | references | null: false, foreign_key: true | 購入された商品ID、itemsテーブルの外部キー |
| order_date         | date       | null: false                    | 注文日                               |
| payment_amount     | integer    | null: false                    | 支払金額                             |
| card_number        | integer    | null: false                    | カード情報                           |
| expiration_date    | integer    | null: false                    | 有効期限                             |
| security_code      | integer    | null: false                    | セキュリティコード                   |
| postal_code        | string     | null: false                    | 郵便番号                             |
| prefecture         | string     | null: false                    | 都道府県                             |
| city               | string     | null: false                    | 市区町村                             |
| address_number     | string     | null: false                    | 番地                                 |
| building_name      | string     | null: false                    | 建物名                               |
| phone_number       | string     | null: false                    | 電話番号                             |
