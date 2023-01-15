class RemoveAgentIdToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :users, :agents
    remove_index :users, :agent_id
    remove_reference :users, :agent
  end
end
