class FixArchiveFouls < ActiveRecord::Migration[5.0]
  def change
    rename_column :fouls, :archive, :archived
  end
end
