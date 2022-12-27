# == Schema Information
#
# Table name: match_posts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)      not null
#  status     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mode_id    :integer          default(1), not null
#  mood_id    :integer          default(1), not null
#  rank_id    :integer          default(1), not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_match_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class MatchPost < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :rank
  belongs_to_active_hash :mood
  belongs_to_active_hash :mode
end
