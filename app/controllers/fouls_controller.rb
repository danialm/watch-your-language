class FoulsController < ApplicationController
  before_action :set_current_game
  before_action :set_points
  before_action :set_owner, only: [:create]
  before_action :set_foul, only: [:update, :destroy]
  before_action :set_fouls, only: [:index, :update, :destroy]

  def index
  end

  def new
    @foul = Foul.new(game: @current_game)
    @users = @current_game.users.where.not(id: current_user.id)
    @reporter = current_user
    @active_nave = "history"
  end

  def create
    Foul.create! description: params[:foul][:description],
                 owner: @owner,
                 reporter: current_user,
                 game: @current_game
    flash[:notice] = "Good job!"
    redirect_to new_game_foul_path @current_game
  end

  def update
    @foul.accepted = params[:foul][:accepted]
    @foul.save!
    render :index
  end

  def destroy
    unless @foul.destroy
      flash[:error] = @foul.errors.full_messages.join(" ")
    end
    render :index
  end

  private

  def set_fouls
    @fouls = @current_game.fouls
  end

  def set_foul
    @foul = @current_game.fouls.find params[:id]
  end

  def set_owner
    @owner = @current_game.users.find params[:foul][:owner_id]
  end

  def set_current_game
    @current_game = Game.find params[:game_id]
  end
end
