module ApplicationHelper
  def flash_bg_color(type)
    color_lists = {
      'notice' => 'teal',
      'danger' => 'red',
      'alert' => 'orange'
    }
    color_lists[type]
  end

  def business_day?(day)
    Time.zone.today <= day && !day.sunday?
  end

  def outside_business_day?(day)
    Time.zone.today > day || day.sunday?
  end

  def business_hours_interval(from_datetime:, to_datetime:)
    increment = 1800 # 30分 * 60 (起算時からの経過秒数を整数で返す)
    from_time = Time.parse(from_datetime).to_i
    to_time   = Time.parse(to_datetime).to_i
    hours = from_time.step(to_time, increment).map do |m|
      Time.at(m).strftime('%H:%M')
    end
    hours.map.with_index do |_t, i|
      next if hours[i + 1].nil?

      [hours[i], hours[i + 1]].join(' ~ ')
    end.compact
  end

  def week_day_appointment_possible_hours
    business_hours_interval(from_datetime: Appointment::STARTED_TIME_BY_WEEK_DAY,
                            to_datetime: Appointment::ENDED_TIME_BY_WEEK_DAY)
  end

  def saturday_appointment_possible_hours
    business_hours_interval(from_datetime: Appointment::STARTED_TIME_BY_SATURDAY,
                            to_datetime: Appointment::ENDED_TIME_BY_SATURDAY)
  end
end
