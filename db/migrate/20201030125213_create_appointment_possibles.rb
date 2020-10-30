class CreateAppointmentPossibles < ActiveRecord::Migration[6.0]
  def change
    create_table :appointment_possibles do |t|
      t.references :financial_planner,      null: false, comment: 'ファイナンシャルプランナーID'
      t.references :financial_planner_post, null: false, comment: 'FP自己紹介投稿ID'
      t.date       :from_date,              null: false, comment: '予約可能日程(from)'
      t.date       :to_date,                null: false, comment: '予約可能日程(to)'

      t.timestamps
    end
  end
end
