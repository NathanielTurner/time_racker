class AddProgrammerIdToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :programmer_id, :integer
  end
end
