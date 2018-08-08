class Settle < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def settled?
    !settled_at.nil?
  end
end
