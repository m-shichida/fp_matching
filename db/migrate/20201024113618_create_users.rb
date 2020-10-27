class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string  :first_name, null: false,               comment: '姓'
      t.string  :last_name,  null: false,               comment: '名'
      t.string  :email,      null: false, unique: true, comment: 'メールアドレス'
      t.integer :gender,     null: false,               comment: '性別'
      t.integer :age,        null: false,               comment: '年齢'
      t.string  :image,                                 comment: '顔写真'
      t.string  :type, null: false, comment: 'customerもしくはfinancial_planer'

      # ここ以下はcustomer
      t.string  :nick_name,               comment: 'ニックネーム'
      t.string  :job_name,                comment: '職業'
      t.integer :household_income,        comment: '世帯年収'
      t.integer :savings,                 comment: '貯蓄額'
      t.boolean :married, default: false, comment: '結婚しているか'
      t.integer :dependent_count,         comment: '扶養人数'
      t.integer :housemate_count,         comment: '同居人数'

      # ここ以下はfinancial_planer
      t.text :career, comment: '経歴'

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
