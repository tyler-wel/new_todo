class CreateTaskLists < ActiveRecord::Migration[5.2]
  def change
    create_table :task_lists do |t|
      t.string :name
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
