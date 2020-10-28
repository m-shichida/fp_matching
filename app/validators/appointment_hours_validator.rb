# 平日の予約枠は 10:00~18:00まで
# 土曜日の予約枠は 11:00~15:00まで
# 日曜日は休業日
class AppointmentHoursValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil?

    if value.sunday?
      record.errors[attribute] << I18n.t('errors.messages.appointment.sunday_is_holiday')
    elsif without_saturday_appointment_hours?(value)
      record.errors[attribute] << I18n.t('errors.messages.appointment.saturday_appointment_hours')
    elsif without_weekday_appointment_hours?(value)
      record.errors[attribute] << I18n.t('errors.messages.appointment.weekday_appointment_hours')
    end
  end

  private

  SATURDAY_STARTED_TIME_TO_STRFTIME = '110000'.freeze
  SATURDAY_ENDED_TIME_TO_STRFTIME = '150059'.freeze
  WEEKDAY_STARTED_TIME_TO_STRFTIME = '100000'.freeze
  WEEKDAY_ENDED_TIME_TO_STRFTIME = '180059'.freeze

  def without_saturday_appointment_hours?(datetime)
    return unless datetime.saturday?

    SATURDAY_STARTED_TIME_TO_STRFTIME >= datetime.strftime('%H%M%S') ||
      datetime.strftime('%H%M') >= SATURDAY_ENDED_TIME_TO_STRFTIME
  end

  def without_weekday_appointment_hours?(datetime)
    return unless weekday?(datetime)

    WEEKDAY_STARTED_TIME_TO_STRFTIME >= datetime.strftime('%H%M%S') ||
      datetime.strftime('%H%M') >= WEEKDAY_STARTED_TIME_TO_STRFTIME
  end

  def weekday?(datetime)
    datetime.monday? || datetime.tuesday? || datetime.wednesday? || datetime.thursday? || datetime.friday?
  end
end
