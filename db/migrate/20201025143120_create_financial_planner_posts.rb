class CreateFinancialPlannerPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_planner_posts do |t|
      t.references :financial_planner, null: false, comment: 'ユーザー(ファイナンシャルプランナー)ID'
      t.string     :title,             null: false, comment: 'タイトル'
      t.text       :description,       null: false, comment: '説明文'
      t.integer    :interview_method,  null: false, comment: '希望面談方法'
      t.string     :place,                          comment: '場所'
      t.string     :url,                            comment: 'URL'

      t.timestamps
    end
  end
end
