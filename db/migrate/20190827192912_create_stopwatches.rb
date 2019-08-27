class CreateStopwatches < ActiveRecord::Migration[5.2]
  def change
    create_table :stopwatches do |t|
      t.string :name
      t.string :description
      t.string :icon
      t.integer :total_time

      t.timestamps
    end
  end
end
