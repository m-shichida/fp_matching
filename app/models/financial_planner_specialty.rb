# == Schema Information
#
# Table name: financial_planner_specialties
#
#  id                        :bigint           not null, primary key
#  financial_planner_post_id :bigint           not null              # ファイナンシャルプランナー投稿ID
#  name                      :string(255)      not null              # 得意分野名
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
class FinancialPlannerSpecialty < ApplicationRecord
  belongs_to :financial_planner_post

  validates :financial_planner_post_id, presence: true
  validates :name, presence: true
end
