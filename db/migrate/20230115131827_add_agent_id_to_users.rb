class AddAgentIdToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :agent_id, :integer
    add_reference :users, :agent, foreign_key: true, default: 1
  end
end
