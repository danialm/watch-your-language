class AddArchiveAndArchiveAtToFouls < ActiveRecord::Migration[5.0]
  def change
    add_column :fouls, :archive, :boolean
    add_column :fouls, :archive_at, :timestamp
  end
end
