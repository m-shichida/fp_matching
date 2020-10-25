module ApplicationHelper
  def flash_bg_color(type)
    color_lists = {
      'notice': 'teal',
      'danger': 'red',
      'alert': 'orange'
    }
    color_lists[type]
  end
end
