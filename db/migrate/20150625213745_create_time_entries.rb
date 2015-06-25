class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.integer :duration

      t.timestamps null: false
    end
  end
end
