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
end
