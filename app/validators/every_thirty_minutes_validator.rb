# 30分刻みでしか予約できない
class EveryThirtyMinutesValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil? || value.min.zero? || value.min == 30

    record.errors[attribute] << I18n.t('errors.messages.appointment.should_every_thirty_minutes')
  end
end
