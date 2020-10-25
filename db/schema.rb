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

ActiveRecord::Schema.define(version: 2020_10_24_113618) do

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "first_name", null: false, comment: "姓"
    t.string "last_name", null: false, comment: "名"
    t.string "email", null: false, comment: "メールアドレス"
    t.integer "gender", null: false, comment: "性別"
    t.integer "age", null: false, comment: "年齢"
    t.string "image", comment: "顔写真"
    t.string "type", null: false, comment: "customerもしくはfinancial_planer"
    t.string "nick_name", null: false, comment: "ニックネーム"
    t.string "job_name", null: false, comment: "職業"
    t.integer "household_income", comment: "世帯年収"
    t.integer "savings", comment: "貯蓄額"
    t.boolean "married", null: false, comment: "結婚しているか"
    t.integer "dependent_count", null: false, comment: "扶養人数"
    t.integer "housemate_count", null: false, comment: "同居人数"
    t.text "self_introduction", null: false, comment: "自己紹介文"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
