# == Schema Information
#
# Table name: agents
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Agent < ApplicationRecord
  has_many :users, through: :user_agents
  has_many :user_agents, dependent: :destroy
end
