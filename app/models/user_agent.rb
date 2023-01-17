# == Schema Information
#
# Table name: user_agents
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  agent_id   :bigint           default(1), not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_agents_on_agent_id  (agent_id)
#  index_user_agents_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (agent_id => agents.id)
#  fk_rails_...  (user_id => users.id)
#
class UserAgent < ApplicationRecord
  belongs_to :agent
  belongs_to :user
end
