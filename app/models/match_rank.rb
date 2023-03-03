# == Schema Information
#
# Table name: match_ranks
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  match_post_id :bigint           not null
#  rank_id       :bigint           not null
#
# Indexes
#
#  index_match_ranks_on_match_post_id  (match_post_id)
#  index_match_ranks_on_rank_id        (rank_id)
#
# Foreign Keys
#
#  fk_rails_...  (match_post_id => match_posts.id)
#  fk_rails_...  (rank_id => ranks.id)
#
class MatchRank < ApplicationRecord
  belongs_to :match_post
  belongs_to :rank

  validates :match_post, presence: true
  validates :rank, presence: true
end
