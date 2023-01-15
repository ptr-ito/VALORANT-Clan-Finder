class User::ProfileSerializer
  include JSONAPI::Serializer
  attributes :id, :uuid, :name, :image, :confirmed_at, :updated_at, :self_introduction, :twitter_name, :youtube_url, :started_on_val, :ingame_name

  attribute :highest_rank do |object|
    object.highest_rank.name.to_s
  end

  attribute :rank do |object|
    object.rank.name.to_s
  end

  attribute :agent do |object|
    object.agents.map(&:name)
  end
end
