class FoulsController < ApplicationController
  before_action :set_owner, only: [:create]
  before_action :set_foul, only: [:update]
  before_action :set_fouls, only: [:index, :update, :update_multiple]

  def index
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
    flash[:notice] = "Good job!"
    redirect_to new_foul_path
  end

  def update
    @foul.accepted = params[:foul][:accepted]
    @foul.save!
    render :index
  end

  private

  def set_fouls
    @fouls = Foul.all_active
  end

  def set_foul
    @foul = Foul.find params[:id]
  end

  def set_owner
    @owner = User.find params[:foul][:owner_id]
  end
end
