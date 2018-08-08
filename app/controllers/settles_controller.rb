class SettlesController < ApplicationController
  before_action :set_current_game
  before_action :set_points
  before_action :set_settle, only: [:update]

  def update
    @settle.settled_at = DateTime.now
    @settle.save!
    @current_game.save!
    redirect_to games_path
  end

  private

  def set_current_game
    @current_game = Game.find params[:game_id]
  end

  def set_settle
    @settle = @current_game.settle_for_user current_user
  end
end
