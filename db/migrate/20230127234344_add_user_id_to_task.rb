class AddUserIdToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :user_id, :integer, foreign_key: true
  end
end
