# == Schema Information
#
# Table name: appointments
#
#  id                   :bigint           not null, primary key
#  ended_at             :datetime         not null              # 面談終了時間
#  interview_method     :integer          not null              # 希望面談方法
#  place                :string(255)                            # 場所
#  started_at           :datetime         not null              # 面談開始時間
#  url                  :string(255)                            # URL
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  customer_id          :bigint           not null              # ユーザーID
#  financial_planner_id :bigint           not null              # ファイナンシャルプランナーID
#
# Indexes
#
#  index_appointments_on_customer_id           (customer_id)
#  index_appointments_on_financial_planner_id  (financial_planner_id)
#
class Appointment < ApplicationRecord
  belongs_to :customer
  belongs_to :financial_planner

  validates :customer_id, presence: true
  validates :financial_planner_id, presence: true
  validates :started_at, presence: true
  validates :ended_at, presence: true
  validates :interview_method, presence: true
  validate :already_exists_appointment

  validates_with AppointmentHoursValidator, attributes: %i[started_at ended_at]
  validates_with EveryThirtyMinutesValidator, attributes: %i[started_at ended_at]

  before_validation :combine_appointment_datetime

  attr_accessor :appointment_date, :appointment_time

  enum interview_method: { face_to_face: 0, video_chat: 1 }

  STARTED_TIME_BY_WEEK_DAY = '10:00'.freeze
  ENDED_TIME_BY_WEEK_DAY = '18:00'.freeze
  STARTED_TIME_BY_SATURDAY = '11:00'.freeze
  ENDED_TIME_BY_SATURDAY = '15:00'.freeze

  private

  def already_exists_appointment
    appointments = Appointment.where(financial_planner_id: financial_planner_id,
                                     started_at: started_at,
                                     ended_at: ended_at)

    errors[:base] << 'すでにこの時間帯に予約がされています' if appointments.present?
  end

  def combine_appointment_datetime
    started_time = appointment_time.split(' ~ ')[0]
    ended_time = appointment_time.split(' ~ ')[1]

    self.started_at = Time.zone.parse("#{ appointment_date }-#{ started_time }")
    self.ended_at = Time.zone.parse("#{ appointment_date }-#{ ended_time }")
  end
end
