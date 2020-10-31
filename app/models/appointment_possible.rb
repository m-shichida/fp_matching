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
class AppointmentPossible < ApplicationRecord
  belongs_to :financial_planner
  belongs_to :financial_planner_post

  validates :financial_planner_id, presence: true
  validates :from_date, presence: true
  validates :to_date, presence: true
  validate :invalid_set_in_the_past
  validate :invalid_duplicate_appointment_possible_date

  private

  def invalid_set_in_the_past
    return if Date.today < from_date && Date.today < to_date

    errors[:base] << I18n.t('errors.messages.appointment_possible.invalid_appoint_in_the_past')
  end

  def invalid_duplicate_appointment_possible_date
    possibles = AppointmentPossible.where(financial_planner_id: financial_planner_id,
                                          financial_planner_post_id: financial_planner_post_id)
                                   .where.not(id: id)
    possibles.each do |possible|
      if ((possible.from_date..possible.to_date).to_a & (from_date..to_date).to_a).present?
        errors[:base] << I18n.t('errors.messages.appointment_possible.duplicate_appointment_possible_date')
      end
    end
  end
end
