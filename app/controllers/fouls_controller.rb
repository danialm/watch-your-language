class FoulsController < ApplicationController
  before_action :set_owner, only: [:create]
  before_action :set_foul, only: [:update]

  def index
    @fouls = Foul.all
  end

  def new
    @foul = Foul.new
    @users = User.where.not(id: current_user.id)
    @reporter = current_user
    @active_nave = "history"
  end

  def create
    Foul.create! description: params[:foul][:description],
                 owner: @owner,
                 reporter: current_user
    redirect_to new_foul_path
  end

  def update
    @foul.accepted = params[:foul][:accepted]
    @foul.save!
    redirect_to fouls_path
  end

  private

  def set_foul
    @foul = Foul.find  params[:id]
  end

  def set_owner
    @owner = User.find params[:foul][:owner_id]
  end
end
