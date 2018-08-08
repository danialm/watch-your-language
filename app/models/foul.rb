class Foul < ApplicationRecord
  belongs_to :game
  belongs_to :reporter, class_name: "User"
  belongs_to :owner, class_name: "User"

  before_save :set_timestamps
  before_destroy :validate_destruction

  default_scope { order(created_at: :desc) }
  scope :active, -> { where(accepted: true) }

  private

  def set_timestamps
    self.accepted_at = DateTime.now if self.accepted && !self.accepted_at
  end

  def validate_destruction
    if self.errors.add(:base, "This has already been accepted.")
      throw :abort
    end
  end
end
