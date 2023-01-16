# frozen_string_literal: true

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
#  uuid                   :string(255)      not null
#  youtube_url            :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  highest_rank_id        :integer          default(1), not null
#  rank_id                :bigint           default(1)
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_rank_id               (rank_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#  index_users_on_uuid                  (uuid) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (rank_id => ranks.id)
#
class User < ApplicationRecord
  include CreateUuid
  has_many :match_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_agents, dependent: :destroy
  has_many :agents, through: :user_agents
  belongs_to :rank

  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable, :confirmable
  include DeviseTokenAuth::Concerns::User

  attr_accessor :redirect_url

  mount_uploader :image, ImageUploader

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :highest_rank
end
