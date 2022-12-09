# == Schema Information
#
# Table name: matches
#
#  id(プライマリキー) :string(36)       not null, primary key
#  body               :text(65535)
#  status             :integer          default("published"), not null
#  title              :string(255)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  mode_id            :integer          not null
#  rank_id            :integer          not null
#  user_id            :string(255)      not null
#
# Indexes
#
#  index_matches_on_id       (id)
#  index_matches_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :match do
    user

    sequence(:title, 'match-title-1')
    sequence(:body, 'match-body-1')
    status { :published }
    rank { Rank.all.sample }
    mode { Mode.all.sample }

    trait :published do
      status { :published }
    end

    trait :closed do
      status { :closed }
    end
  end
end
