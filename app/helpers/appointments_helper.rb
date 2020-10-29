module AppointmentsHelper
  # TODO: あとですでに予約済み・FP側が予約不可とした時間帯を外す(decoratorで)
  # TODO: あとで平日・休日を考慮した時間帯に変更する

  def appointment_time_by_day_of_week
    [
      ['10:00 ~ 10:30'],['10:30 ~ 11:00']
    ]
  end
end
