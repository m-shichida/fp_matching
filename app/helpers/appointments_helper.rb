module AppointmentsHelper
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
