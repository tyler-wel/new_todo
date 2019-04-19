class CreateBoardUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :board_users do |t|
      t.references :user, foreign_key: true
      t.references :board, foreign_key: true
      t.boolean :is_owner, :default => false
      t.timestamps
    end
  end
end
