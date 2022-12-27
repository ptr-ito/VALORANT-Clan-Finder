class User::ProfileSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :image, :self_introduction, :rank_id, :agent_id
end
