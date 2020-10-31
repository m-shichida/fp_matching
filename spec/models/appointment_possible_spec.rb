# == Schema Information
#
# Table name: appointment_possibles
#
#  id                        :bigint           not null, primary key
#  from_date                 :date             not null              # 予約可能日程(from)
#  to_date                   :date             not null              # 予約可能日程(to)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  financial_planner_id      :bigint           not null              # ファイナンシャルプランナーID
#  financial_planner_post_id :bigint           not null              # FP自己紹介投稿ID
#
# Indexes
#
#  index_appointment_possibles_on_financial_planner_id       (financial_planner_id)
#  index_appointment_possibles_on_financial_planner_post_id  (financial_planner_post_id)
#
require 'rails_helper'

RSpec.describe AppointmentPossible, type: :model do
  pending "add some examples to (or delete) #{ __FILE__ }"
end
