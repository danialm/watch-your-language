class RemoveArchivedFromFouls < ActiveRecord::Migration[5.0]
  def change
    remove_column :fouls, :archived, :boolean
    remove_column :fouls, :archived_at, :timestamp
  end
end
