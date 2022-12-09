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
FactoryBot.define do
  factory :user do
    sequence(:sub) { |n| "test-sub-#{n}" }
  end
end
