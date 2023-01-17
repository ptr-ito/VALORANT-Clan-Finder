class AddDefaultToUserAgent < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:user_agents, :agent_id, from: nil, to: 1)
    change_column_default(:user_agents, :user_id, from: 0, to: nil)
  end
end
