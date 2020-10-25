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
require 'rails_helper'

RSpec.describe FinancialPlannerSpecialty, type: :model do
  pending "add some examples to (or delete) #{ __FILE__ }"
end
