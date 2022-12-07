# == Schema Information
#
# Table name: matches
#
#  id(プライマリキー) :string(36)       not null, primary key
#  body               :text(65535)
#  status             :integer          default(0), not null
#  title              :string(255)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  mode_id            :integer          not null
#  rank_id            :integer          not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_matches_on_id       (id)
#  index_matches_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Match < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :rank
  belongs_to_active_hash :mode

  belongs_to :user

  enum :status, { published: 0, closed: 1}
end
