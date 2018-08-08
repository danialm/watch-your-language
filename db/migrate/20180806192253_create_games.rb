class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.boolean :archived
      t.timestamp :archived_at

      t.timestamps
    end
  end
end
