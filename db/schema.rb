# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_30_125213) do

  create_table "appointment_possibles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "financial_planner_id", null: false, comment: "ファイナンシャルプランナーID"
    t.bigint "financial_planner_post_id", null: false, comment: "FP自己紹介投稿ID"
    t.date "from_date", null: false, comment: "予約可能時間(from)"
    t.date "to_date", null: false, comment: "予約可能時間(to)"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["financial_planner_id"], name: "index_appointment_possibles_on_financial_planner_id"
    t.index ["financial_planner_post_id"], name: "index_appointment_possibles_on_financial_planner_post_id"
  end

  create_table "appointments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "customer_id", null: false, comment: "ユーザーID"
    t.bigint "financial_planner_id", null: false, comment: "ファイナンシャルプランナーID"
    t.datetime "started_at", null: false, comment: "面談開始時間"
    t.datetime "ended_at", null: false, comment: "面談終了時間"
    t.integer "interview_method", null: false, comment: "希望面談方法"
    t.string "url", comment: "URL"
    t.string "place", comment: "場所"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_appointments_on_customer_id"
    t.index ["financial_planner_id"], name: "index_appointments_on_financial_planner_id"
  end

  create_table "financial_planner_posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "financial_planner_id", null: false, comment: "ユーザー(ファイナンシャルプランナー)ID"
    t.string "title", null: false, comment: "タイトル"
    t.text "description", null: false, comment: "説明文"
    t.integer "interview_method", null: false, comment: "希望面談方法"
    t.string "place", comment: "場所"
    t.string "url", comment: "URL"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["financial_planner_id"], name: "index_financial_planner_posts_on_financial_planner_id"
  end

  create_table "financial_planner_specialties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "financial_planner_post_id", null: false, comment: "ファイナンシャルプランナー投稿ID"
    t.string "name", null: false, comment: "得意分野名"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["financial_planner_post_id"], name: "index_financial_planner_specialties_on_financial_planner_post_id"
  end

  create_table "non_appointment_datetimes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "financial_planner_id", null: false, comment: "ファイナンシャルプランナーID"
    t.bigint "financial_planner_post_id", null: false, comment: "FP自己紹介投稿ID"
    t.datetime "started_at", null: false, comment: "予約負荷時間(from)"
    t.datetime "ended_at", null: false, comment: "予約負荷時間(to)"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["financial_planner_id"], name: "index_non_appointment_datetimes_on_financial_planner_id"
    t.index ["financial_planner_post_id"], name: "index_non_appointment_datetimes_on_financial_planner_post_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "first_name", null: false, comment: "姓"
    t.string "last_name", null: false, comment: "名"
    t.string "email", null: false, comment: "メールアドレス"
    t.integer "gender", null: false, comment: "性別"
    t.integer "age", null: false, comment: "年齢"
    t.string "image", comment: "顔写真"
    t.string "type", null: false, comment: "customerもしくはfinancial_planer"
    t.string "nick_name", comment: "ニックネーム"
    t.string "job_name", comment: "職業"
    t.integer "household_income", comment: "世帯年収"
    t.integer "savings", comment: "貯蓄額"
    t.boolean "married", default: false, comment: "結婚しているか"
    t.integer "dependent_count", comment: "扶養人数"
    t.integer "housemate_count", comment: "同居人数"
    t.text "career", comment: "経歴"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "financial_planner_specialties", "financial_planner_posts"
end
