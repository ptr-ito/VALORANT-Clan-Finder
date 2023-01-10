# == Schema Information
#
# Table name: ranks
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Rank < ApplicationRecord
  has_many :match_rank, dependent: :destroy
  has_many :match_posts, through: :match_ranks
end
