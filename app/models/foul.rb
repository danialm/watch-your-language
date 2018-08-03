class Foul < ApplicationRecord
  belongs_to :reporter, class_name: "User"
  belongs_to :owner, class_name: "User"

  default_scope { order(created_at: :desc) }

  before_save :set_timestamps

  class << self
    def active_fouls_for_others(user)
      active_fouls.where.not(owner: user)
    end

    def active_fouls_for_user(user)
      active_fouls.where(owner: user)
    end

    def active_fouls
      where(archived: [false, nil])
    end
  end

  private

  def set_timestamps
    self.archived_at = DateTime.now if self.archived && !self.archived_at
    self.accepted_at = DateTime.now if self.accepted && !self.accepted_at
  end
end
