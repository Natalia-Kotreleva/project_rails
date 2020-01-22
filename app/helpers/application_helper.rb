module ApplicationHelper
  def form_time(time)
    time.strftime("%Y")
  end

  def flash_message
    content_tag :p, flash[:alert], class: 'flash flash--alert' if flash[:alert]
  end
end
