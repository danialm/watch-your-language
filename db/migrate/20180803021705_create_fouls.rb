class CreateFouls < ActiveRecord::Migration[5.0]
  def change
    create_table :fouls do |t|
      t.text :description
      t.references :reporter
      t.references :owner
      t.boolean :accepted
      t.timestamp :accepted_at

      t.timestamps
    end
  end
end
