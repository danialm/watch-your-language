module ApplicationHelper
  def user_name(user)
    user.name || user.email
  end

  def show_time(dateTime)
    dateTime
      .in_time_zone("Pacific Time (US & Canada)")
      .strftime("%B %d, %Y %H:%M")
  end
end
