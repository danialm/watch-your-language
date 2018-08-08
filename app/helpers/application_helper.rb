module ApplicationHelper
  def user_name(user)
    user.name || user.email
  end

  def show_time(dateTime)
    dateTime
      .in_time_zone("Pacific Time (US & Canada)")
      .strftime("%B %d, %Y %H:%M")
  end

  def get_alert_class(name)
    case name.to_s
    when 'notice'
      alert_class = 'success'
    when 'success'
      alert_class = 'success'
    when 'info'
      alert_class = 'info'
    when 'warning'
      alert_class = 'warning'
    else
      alert_class = 'danger'
    end

    "alert alert-#{alert_class}"
  end
end
