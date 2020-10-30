# == Schema Information
#
# Table name: appointment_possibles
#
#  id                        :bigint           not null, primary key
#  from_date                 :date             not null              # 予約可能時間(from)
#  to_date                   :date             not null              # 予約可能時間(to)
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
class AppointmentPossible < ApplicationRecord
  belongs_to :financial_planner
  belongs_to :financial_planner_post

  validates :financial_planner_id, presence: true
  validates :from_date, presence: true
  validates :to_date, presence: true
end
