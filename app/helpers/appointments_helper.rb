module AppointmentsHelper
  def appointment_time_by_day_of_week
    [
      ['10:00 ~ 10:30'], ['10:30 ~ 11:00'],
      ['11:00 ~ 11:30'], ['11:30 ~ 12:00'],
      ['12:00 ~ 12:30'], ['12:30 ~ 13:00'],
      ['13:00 ~ 13:30'], ['13:30 ~ 14:00'],
      ['14:00 ~ 14:30'], ['14:30 ~ 15:00'],
      ['15:00 ~ 15:30'], ['15:30 ~ 16:00'],
      ['16:00 ~ 16:30'], ['16:30 ~ 17:00'],
      ['17:00 ~ 17:30'], ['17:30 ~ 18:00']
    ]
  end

  def appointment_time_by_saturday
    [
      ['11:00 ~ 11:30'], ['11:30 ~ 12:00'],
      ['12:00 ~ 12:30'], ['12:30 ~ 13:00'],
      ['13:00 ~ 13:30'], ['13:30 ~ 14:00'],
      ['14:00 ~ 14:30'], ['14:30 ~ 15:00']
    ]
  end

  # 過半数が予約されていたら△表示する
  def appointment_possible_state(appointments)
    return '○' if appointments.empty?

    if appointments.first.started_at.saturday?
      appointments.count > 4 ? '△' : '○'
    else
      appointments.count > 8 ? '△' : '○'
    end
  end

  def allow_appoointment?(financial_planner:, day:)
    possible_days = financial_planner.appointment_possibles.map do |possible|
      (possible.from_date..possible.to_date).to_a
    end

    possible_days.flatten.include?(day)
  end
end
