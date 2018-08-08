class AddReferenceToFoul < ActiveRecord::Migration[5.0]
  def change
    add_reference :fouls, :game
  end
end
