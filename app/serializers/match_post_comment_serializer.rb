class MatchPostCommentSerializer
  include JSONAPI::Serializer
  attributes :content, :created_at
end
