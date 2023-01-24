class AddDefaultToUserAgents < ActiveRecord::Migration[7.0]
  def change
    change_column_default :user_agents, :agent_id, from: nil, to: 1
  end
end
