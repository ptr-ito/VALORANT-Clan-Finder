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
class MatchPostSerializer
  include JSONAPI::Serializer
  extend ActionView::Helpers::DateHelper
  attributes :id, :uuid, :content, :status, :created_at, :user_id

  attribute :user_uuid do |object|
    object.user.uuid.to_s
  end

  attribute :rank do |object|
    object.ranks.map(&:name)
  end

  attribute :mode do |object|
    object.mode.name.to_s
  end

  attribute :mood do |object|
    object.mood.name.to_s
  end

  attribute :user_name do |object|
    object.user.name.to_s
  end

  attribute :user_image do |object|
    object.user.image
  end

  attribute :created_at do |object|
    if object.created_at > 1.day.ago
      time_ago_in_words(object.created_at, include_seconds: true)
    else
      object.created_at.strftime('%F')
    end
  end
end
