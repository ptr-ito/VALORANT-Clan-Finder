# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  commentable_type :string(255)      not null
#  content          :text(65535)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :bigint           not null
#  root_id          :bigint
#  user_id          :bigint           not null
#
# Indexes
#
#  index_comments_on_commentable  (commentable_type,commentable_id)
#  index_comments_on_root_id      (root_id)
#  index_comments_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (root_id => comments.id)
#
class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true, inverse_of: :comments
  belongs_to :user
  validates :content, presence: true, length: { maximum: 65_535 }

  has_many :replies, class_name: 'Comment', foreign_key: :root_id, dependent: :destroy  # rubocop:disable Rails/InverseOf
end
