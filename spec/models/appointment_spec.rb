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
require 'rails_helper'

RSpec.describe Appointment, type: :model do
  SUNDAY_DATE = '2020/10/4'
  SUNDAY_TIME = '10:00 ~ 10:30'
  NOT_EVERY_THIRTY_MINUTES_DATE = '2020/10/5'
  NOT_EVERY_THIRTY_MINUTES_DATE_TIME = '11:10 ~ 11:40'
  OUTSIDE_WEEKDAYS_APPOINTMENT_DATE = '2020/10/5'
  OUTSIDE_WEEKDAYS_APPOINTMENT_TIME = '09:00 ~ 09:30'
  OUTSIDE_SATURDAY_APPOINTMENT_DATE = '2020/10/3'
  OUTSIDE_SATURDAY_APPOINTMENT_TIME = '09:00 ~ 09:30'

  # 面談開始時間のバリデーション
  it '面談開始時間は日曜日に設定すると無効であること' do
    appointment = Appointment.new(appointment_date: SUNDAY_DATE, appointment_time: SUNDAY_TIME)
    appointment.valid?
    expect(appointment.errors[:started_at]).to include('日曜日は休業日です')
  end

  it '面談開始時間は30分刻みではない時間に予約すると無効であること' do
    appointment = Appointment.new(appointment_date: NOT_EVERY_THIRTY_MINUTES_DATE, appointment_time: NOT_EVERY_THIRTY_MINUTES_DATE_TIME)
    appointment.valid?
    expect(appointment.errors[:started_at]).to include('は30分刻みでしか予約できません')
  end

  it '面談開始時間は平日の10:00~18:00以外の予約時間外に予約しようとすると無効であること' do
    appointment = Appointment.new(appointment_date: OUTSIDE_WEEKDAYS_APPOINTMENT_DATE, appointment_time: OUTSIDE_WEEKDAYS_APPOINTMENT_TIME)
    appointment.valid?
    expect(appointment.errors[:started_at]).to include('平日の予約枠は10:00 ~ 18:00までです')
  end

  it '面談開始時間は土曜日の11:00~15:00以外の予約時間外に予約しようとすると無効であること' do
    appointment = Appointment.new(appointment_date: OUTSIDE_SATURDAY_APPOINTMENT_DATE, appointment_time: OUTSIDE_SATURDAY_APPOINTMENT_TIME)
    appointment.valid?
    expect(appointment.errors[:started_at]).to include('土曜日の営業時間は11:00 ~ 15:00までです')
  end

  # 面談終了時間のバリデーション
  it '面談終了時間は日曜日に設定すると無効であること' do
    appointment = Appointment.new(appointment_date: SUNDAY_DATE, appointment_time: SUNDAY_TIME)
    appointment.valid?
    expect(appointment.errors[:ended_at]).to include('日曜日は休業日です')
  end

  it '面談終了時間は30分刻みではない時間に予約すると無効であること' do
    appointment = Appointment.new(appointment_date: NOT_EVERY_THIRTY_MINUTES_DATE, appointment_time: NOT_EVERY_THIRTY_MINUTES_DATE_TIME)

    appointment.valid?

    puts '------------------------'
    puts appointment.started_at
    puts appointment.ended_at
    puts '------------------------'

    expect(appointment.errors[:ended_at]).to include('は30分刻みでしか予約できません')
  end

  it '面談終了時間は平日の10:00~18:00以外の予約時間外に予約しようとすると無効であること' do
    appointment = Appointment.new(appointment_date: OUTSIDE_WEEKDAYS_APPOINTMENT_DATE, appointment_time: OUTSIDE_WEEKDAYS_APPOINTMENT_TIME)
    appointment.valid?
    expect(appointment.errors[:ended_at]).to include('平日の予約枠は10:00 ~ 18:00までです')
  end

  it '面談終了時間は土曜日の11:00~15:00以外の予約時間外に予約しようとすると無効であること' do
    appointment = Appointment.new(appointment_date: OUTSIDE_SATURDAY_APPOINTMENT_DATE, appointment_time: OUTSIDE_SATURDAY_APPOINTMENT_TIME)
    appointment.valid?
    expect(appointment.errors[:ended_at]).to include('土曜日の営業時間は11:00 ~ 15:00までです')
  end
end
