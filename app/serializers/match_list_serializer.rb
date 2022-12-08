class MatchListSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :body, :status


  attribute :rank_id do |object|
    object.rank.name.to_s
  end

  attribute :mode_id do |object|
    object.mode.name.to_s
  end
end
