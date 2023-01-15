class SessionsSerializer
  include JSONAPI::Serializer
  attributes :email, :provider, :uid, :image, :id, :self_introduction, :twitter_name, :youtube_url, :started_on_val, :ingame_name, :name

  attribute :rank do |object|
    object.rank.name.to_s
  end

  attribute :highest_rank do |object|
    object.highest_rank.name.to_s
  end
end
