class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :customer,          null: false, comment: 'ユーザーID'
      t.references :financial_planner, null: false, comment: 'ファイナンシャルプランナーID'
      t.datetime   :started_at,        null: false, comment: '面談開始時間'
      t.datetime   :ended_at,          null: false, comment: '面談終了時間'
      t.integer    :interview_method,  null: false, comment: '希望面談方法'
      t.string     :url,                            comment: 'URL'
      t.string     :place,                          comment: '場所'

      t.timestamps
    end
  end
end
