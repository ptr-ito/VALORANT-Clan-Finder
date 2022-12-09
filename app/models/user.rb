# == Schema Information
#
# Table name: users
#
#  id(プライマリキー) :string(36)       not null, primary key
#  sub                :string(255)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_id   (id)
#  index_users_on_sub  (sub)
#
class User < ApplicationRecord
  has_many :mathes, dependent: :destroy

  def self.from_token_payload(payload)
    find_by(sub: payload['sub']) || create!(sub: payload['sub'])
  end
end
