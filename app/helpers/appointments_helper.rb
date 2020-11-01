module AppointmentsHelper
  # 過半数が予約されていたら△表示する
  def appointment_possible_state(appointments)
    return '○' if appointments.empty?

    max_count = appointments.first.started_at.saturday? ? 8 : 16

    if appointments.count == max_count
      '×'
    elsif appointments.count > max_count / 2
      '△'
    else
      '○'
    end
  end

  def empty_appointment?(appointments)
    max_count = appointments.first.started_at.saturday? ? 8 : 16

    appointments.count != max_count
  end

  def allow_appoointment?(financial_planner:, day:)
    possible_days = financial_planner.appointment_possibles.map do |possible|
      (possible.from_date..possible.to_date).to_a
    end

    possible_days.flatten.include?(day)
  end
end
