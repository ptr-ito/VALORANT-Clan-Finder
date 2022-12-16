class AddUserStatusToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :rank_id, :integer
    add_column :users, :agent_id, :integer
  end
end
