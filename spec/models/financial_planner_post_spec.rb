# == Schema Information
#
# Table name: financial_planner_posts
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null              # ユーザー(ファイナンシャルプランナー)ID
#  title            :string(255)      not null              # タイトル
#  description      :text(65535)      not null              # 説明文
#  interview_method :integer          not null              # 希望面談方法
#  place            :string(255)                            # 場所
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'rails_helper'

RSpec.describe FinancialPlannerPost, type: :model do
  pending "add some examples to (or delete) #{ __FILE__ }"
end
