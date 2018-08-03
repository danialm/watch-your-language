class Foul < ApplicationRecord
  belongs_to :reporter, class_name: "User"
  belongs_to :owner, class_name: "User"

  default_scope { order(created_at: :desc) }
end
