# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  commentable_type :string(255)      not null
#  content          :text(65535)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :bigint           not null
#  root_id          :bigint
#  user_id          :bigint           not null
#
# Indexes
#
#  index_comments_on_commentable  (commentable_type,commentable_id)
#  index_comments_on_root_id      (root_id)
#  index_comments_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (root_id => comments.id)
#
class CommentSerializer
  include JSONAPI::Serializer
  extend ActionView::Helpers::DateHelper
  attributes :id, :content, :created_at, :user_id, :root_id, :commentable_id, :commentable_type

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

  attribute :user_uuid do |object|
    object.user.uuid.to_s
  end
end
