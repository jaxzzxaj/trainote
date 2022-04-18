# Trainote
 主にスマートフォンで記録し、グラフはPCでの確認を想定してます。

## 概要
このアプリケーションでは、筋トレやダイエットに励んでいる人向けに自分の運動や食事管理体調や睡眠時間などを記録できます。
また、筋トレ部位別、有酸素種目別、PFC別に自分の成長をグラフで確認することができます。


## なぜ作成したのか
ジムや屋内、屋外で筋トレや有酸素をノートや携帯のメモ帳を使って運動の記録を手書きで書くのが煩わしく感じたので、簡潔にメモをとれるアプリケーションを作りたいと思ったからです。

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------  |
| nickname           | string | null: false               |
| email              | string | unique: true, null: false |
| encrypted_password | string | null: false               |

### Association

-has_many :manages

## manages テーブル

| Column                     | Type      | Options           | default     |
| -------------------------- | --------- | ----------------- |-------------|
| arms_workout_id            | integer   | null: false       | active_hash | 腕トレメニュー
| chest_workout_id           | integer   | null: false       | active_hash | 胸トレメニュー
| legs_workout_id            | integer   | null: false       | active_hash | 脚トレメニュー
| abs_workout_id             | integer   | null: false       | active_hash | 腹トレメニュー
| back_workout_id            | integer   | null: false       | active_hash | 背トレメニュー
| shoulder_workout_id        | integer   | null: false       | active_hash | 肩トレメニュー
| weight                     | integer   | null: false       |             | 負荷
| reps                       | integer   | null: false       |             | 回数
| sets                       | integer   | null: false       |             | セット数
| walk_spd_id                | integer   | null: false       | active_hash | 徒歩速度
| jog_spd_id                 | integer   | null: false       | active_hash | 小走り速度
| run_spd_id                 | integer   | null: false       | active_hash | 走る速度
| swim_spd_id                | integer   | null: false       | active_hash | 泳ぐ速度
| length                     | integer   | null: false       |             | 経過時間
| breakfast                  | string    |                   |             | 朝食
| lunch                      | string    |                   |             | 昼食
| snack                      | string    |                   |             | 間食
| dinner                     | string    |                   |             | 夕食
| water                      | integer   |                   |             | 水分量
| burn_calories              | integer   | null: false       |             |（推定）消費カロリー
| protein                    | integer   | null: false       |             | タンパク質
| fat                        | integer   | null: false       |             | 脂質
| carbo                      | integer   | null: false       |             | 炭水化物
| intake_calories            | integer   | null: false       |             |（推定）摂取カロリー
| sleep                      | integer   | null: false       |             | 睡眠時間
| memo                       | text      | null: false       |             | メモ
| condition_id               | integer   | null: false       | active_hash | ５段階の気分
| user                       | references| foreign_key: true |             |

### Association

-belongs_to :user
-has_many   :tags

## tags テーブル

| Column      | Type        | Options              |
| ----------- | ----------- | -------------------- |
| tag_name    | string      | uniqueness: true     |

## Association

-has_many :manage_tag_relation
-has_many :manages, through :manage_tag_relations

## manage_tag_relations テーブル

| Column                          | Type       | Options                        |
| ------------------------------- | ---------- | ------------------------------ |
| manage                          | references | null: false, foreign_key: true |
| tag                             | references | null: false, foreign_key: true |

## Association

-belongs_to :manage
-belongs_to :tag