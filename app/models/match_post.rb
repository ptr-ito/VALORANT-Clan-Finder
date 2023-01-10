# == Schema Information
#
# Table name: match_posts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)      not null
#  status     :integer          default("published"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mode_id    :integer          not null
#  mood_id    :integer          not null
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
  has_many :match_ranks, dependent: :destroy
  has_many :ranks, through: :match_ranks

  extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :rank
  belongs_to_active_hash :mood
  belongs_to_active_hash :mode

  validates :content, presence: true, length: { maximum: 140 }
  validates :mode_id, presence: true
  validates :mood_id, presence: true

  enum :status, { published: 0, closed: 1 }
end
