class Game < ApplicationRecord
  has_many :fouls, dependent: :destroy
  has_many :users , through: :settles
  has_many :settles, dependent: :destroy

  validate :users_uniq, on: :create

  before_save :archive_if_all_settled

  default_scope { order created_at: :desc }

  class << self
    def find_active_for_players(users)
      Game.where(archived: [nil, false]).select do |game|
        game.users.sort == users.sort
      end
    end
  end

  def settle_for_user(user)
    settles.where(user: user).first
  end

  def fouls_for_user(user)
    fouls.active.where(owner: user)
  end

  private

  def users_uniq
    errors.add(:base, 'This game is already active.') if
      Game.find_active_for_players(self.users).count > 0
  end

  def archive_if_all_settled
    return unless self.settles.all? { |settle| settle.settled? }

    self.archived = true
    self.archived_at = DateTime.now
  end
end
