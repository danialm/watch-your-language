class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_user_point
  before_action :set_today
  # protected

  # def after_sign_in_path_for(resource)
  #   root_path
  # end

  # def after_sign_out_path_for(resource)
  #   root_path
  # end

  private

  def set_user_point
    @points = Foul.active_fouls_for_others(current_user).count -
              Foul.active_fouls_for_user(current_user).count
  end

  def set_today
    @today = DateTime.now.in_time_zone("Pacific Time (US & Canada)").day
  end
end
