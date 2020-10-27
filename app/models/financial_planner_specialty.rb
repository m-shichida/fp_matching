# == Schema Information
#
# Table name: financial_planner_specialties
#
#  id                        :bigint           not null, primary key
#  name                      :string(255)      not null              # 得意分野名
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  financial_planner_post_id :bigint           not null              # ファイナンシャルプランナー投稿ID
#
# Indexes
#
#  index_financial_planner_specialties_on_financial_planner_post_id  (financial_planner_post_id)
#
# Foreign Keys
#
#  fk_rails_...  (financial_planner_post_id => financial_planner_posts.id)
#
class FinancialPlannerSpecialty < ApplicationRecord
  belongs_to :financial_planner_post

  validates :financial_planner_post_id, presence: true
  validates :name, presence: true
end
