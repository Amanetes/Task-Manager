class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false, index: true
      t.text :description, null: false
      t.references :creator, null: false, foreign_key: { to_table: 'users'}
      t.references :executor, null: false, foreign_key: { to_table: 'users'}
      t.references :task_status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
