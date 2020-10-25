class CreateFinancialPlannerSpecialties < ActiveRecord::Migration[6.0]
  def change
    create_table :financial_planner_specialties do |t|
      t.references :financial_planner_post, null: false, foreign_key: true, comment: 'ファイナンシャルプランナー投稿ID'
      t.string     :name,                   null: false,                    comment: '得意分野名'

      t.timestamps
    end
  end
end
