class AddIndexToTaskStatuses < ActiveRecord::Migration[7.0]
  def change
    add_index :task_statuses, :name, unique: true
  end
end
