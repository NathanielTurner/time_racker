class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :time_limit

      t.timestamps null: false
    end
  end
end
