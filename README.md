## usersテーブル

| Column     | Type       | Options     |
| ------     | ---------- | ------------|
| email      | string     | null: false | <!--email,文字列,not null制約-->
| password   | string     | null: false | <!--password,文字列,not null制約-->
| name       | string     | null: false | <!--name,文字列,not null制約-->
| profile    | text       | null: false | <!--profile,長い文字列,not null制約-->
| occupation | text       | null: false | <!--occupation,長い文字列,not null制約-->
| position   | text       | null: false | <!--position,長い文字列,not null制約-->

### Association
- has_many : :prototypes <!--1対多-->
- has_many :through: comments <!--多対多-->

## prototypesテーブル

| Column     | Type       | Options                        |
| ------     | ---------- | -------------------------------|
| title      | string     | null: false                    | <!--title,文字列,not null制約-->
| catch_copy | text       | null: false                    | <!--catch_copy,長い文字列,not null制約-->
| concept    | text       | null: false                    | <!--concept,長い文字列,not null制約-->
| image      |            |                                | <!--ActiveStorageで実装-->
| user       | references | null: false, foreign_key: true | <!--user,外部キー,not null制約-->

### Association
- belongs_to:user <!--1対1-->
- has_many  :through: comments <!--多対多-->

## commentsテーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| text      | text       | null: false                    | <!--text,文字列,not null制約-->
| user      | references | null: false, foreign_key: true | <!--user,外部キー,not null制約-->
| prototype | references | null: false, foreign_key: true | <!--prototype,外部キー,not null制約-->

### Association
- belongs_to :user <!--1対1-->
- belongs_to :prototype <!--1対1-->
