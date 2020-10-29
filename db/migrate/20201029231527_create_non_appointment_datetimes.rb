class CreateNonAppointmentDatetimes < ActiveRecord::Migration[6.0]
  def change
    create_table :non_appointment_datetimes do |t|
      t.references :financial_planner,      null: false, comment: 'ファイナンシャルプランナーID'
      t.references :financial_planner_post, null: false, comment: 'FP自己紹介投稿ID'
      t.datetime   :started_at,             null: false, comment: '予約負荷時間(from)'
      t.datetime   :ended_at,               null: false, comment: '予約負荷時間(to)'

      t.timestamps
    end
  end
end
