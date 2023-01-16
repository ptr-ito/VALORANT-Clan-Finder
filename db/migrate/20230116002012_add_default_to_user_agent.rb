class AddDefaultToUserAgent < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:user_agents, :agent_id, from: nil, to: 0)
    change_column_default(:user_agents, :user_id, from: nil, to: 0)
    change_column_null(:user_agents, :agent_id, true)
    change_column_null(:user_agents, :user_id, true)
  end
end
