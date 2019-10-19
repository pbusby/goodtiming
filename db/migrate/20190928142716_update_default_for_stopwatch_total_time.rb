class UpdateDefaultForStopwatchTotalTime < ActiveRecord::Migration[5.2]
  def change
    change_column :stopwatches, :total_time, :integer, :default => 0
  end
end
