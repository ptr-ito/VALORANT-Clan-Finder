class MatchPostCommentSerializer
  include JSONAPI::Serializer
  extend ActionView::Helpers::DateHelper
  attributes :id, :content, :created_at, :user_id, :match_post_id

  attribute :created_at do |object|
    if object.created_at > 1.day.ago
      time_ago_in_words(object.created_at, include_seconds: true)
    else
      object.created_at.strftime('%F')
    end
  end

  attribute :user_name do |object|
    object.user.name.to_s
  end

  attribute :user_image do |object|
    object.user.image
  end
end
