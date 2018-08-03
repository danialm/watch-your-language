class FixArchiveAtFouls < ActiveRecord::Migration[5.0]
  def change
    rename_column :fouls, :archive_at, :archived_at
  end
end
