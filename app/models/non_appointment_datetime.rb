# == Schema Information
#
# Table name: non_appointment_datetimes
#
#  id                        :bigint           not null, primary key
#  ended_at                  :datetime         not null              # 予約負荷時間(to)
#  started_at                :datetime         not null              # 予約負荷時間(from)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  financial_planner_id      :bigint           not null              # ファイナンシャルプランナーID
#  financial_planner_post_id :bigint           not null              # FP自己紹介投稿ID
#
# Indexes
#
#  index_non_appointment_datetimes_on_financial_planner_id       (financial_planner_id)
#  index_non_appointment_datetimes_on_financial_planner_post_id  (financial_planner_post_id)
#
class NonAppointmentDatetime < ApplicationRecord
  belongs_to :financial_planner
  belongs_to :financial_planner_post
end
