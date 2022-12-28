class MatchPostSerializer
  include JSONAPI::Serializer
  attributes :id, :content, :status

attribute :rank do |object|
    object.rank.name.to_s
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
end