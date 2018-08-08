class CreateSettles < ActiveRecord::Migration[5.0]
  def change
    create_table :settles do |t|
      t.belongs_to :user, index: true
      t.belongs_to :game, index: true

      t.timestamp :settled_at

      t.timestamps
    end
  end
end
