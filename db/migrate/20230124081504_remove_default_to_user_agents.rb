class RemoveDefaultToUserAgents < ActiveRecord::Migration[7.0]
  def change
    change_column_default :user_agents, :agent_id, from: 1, to: nil
  end
end
