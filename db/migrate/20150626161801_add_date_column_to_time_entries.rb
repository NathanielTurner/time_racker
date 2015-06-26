class AddDateColumnToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :date, :date
  end
end
