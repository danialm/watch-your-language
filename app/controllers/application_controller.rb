class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_today

  protected

  def set_current_game
    @current_game = current_user.games.first
    redirect_to new_game_path if @current_game.nil? || @current_game.archived
  end

  def set_points
    if @current_game
      fouls = @current_game.fouls.active
      @points = fouls.where.not(owner: current_user).count - fouls.where(owner: current_user).count
      return
    end

    @points = 0
  end

  private

  def set_today
    @today = DateTime.now.in_time_zone("Pacific Time (US & Canada)").day
  end
end
