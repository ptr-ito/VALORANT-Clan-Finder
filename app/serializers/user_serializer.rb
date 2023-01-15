# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  email                  :string(255)
#  encrypted_password     :string(255)      default(""), not null
#  highest_rank           :string(255)
#  image                  :string(255)
#  ingame_name            :string(255)
#  name                   :string(255)
#  nickname               :string(255)
#  provider               :string(255)      default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  self_introduction      :text(65535)
#  started_on_val         :string(255)
#  tokens                 :text(65535)
#  twitter_name           :string(255)
#  uid                    :string(255)      default(""), not null
#  unconfirmed_email      :string(255)
#  youtube_url            :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  rank_id                :bigint           default(1)
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_rank_id               (rank_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (rank_id => ranks.id)
#
class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :image, :confirmed_at, :updated_at, :self_introduction, :twitter_name, :youtube_url, :started_on_val, :ingame_name

  attribute :is_login do
    true
  end

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
