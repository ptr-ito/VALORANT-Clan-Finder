class MatchPostCommentSerializer
  include JSONAPI::Serializer
  attributes :id, :content, :created_at
end
