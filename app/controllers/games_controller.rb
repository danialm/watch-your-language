class GamesController < ApplicationController
  before_action :set_games, only: [:index]
  before_action :set_new_game, only: [:new]
  before_action :set_opponents, only: [:new, :index]
  before_action :set_opponent, only: [:create]
  before_action :set_current_game, except: [:new, :create]
  before_action :set_points

  def index
  end

  def new
  end

  def create
    game = Game.new
    players = [@opponent, current_user]
    players.each { |player| game.users << player }

    unless game.valid?
      flash[:info] = game.errors.full_messages.join(" ")
      game = Game.find_active_for_players(players).first
    end

    game.save
    redirect_to new_game_foul_path(game)
  end

  def update
  end

  private

  def set_new_game
    @new_game = Game.new
  end

  def set_games
    @games = current_user.games
  end

  def set_opponents
    @opponents = User.where.not id: current_user.id
  end

  def set_opponent
    # this is just one id (string) not an array
    @opponent = User.find params[:game][:user_ids]
  end
end
