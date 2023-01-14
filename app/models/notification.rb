# == Schema Information
#
# Table name: notifications
#
#  id          :bigint           not null, primary key
#  is_read     :boolean          default(FALSE)
#  message     :string(255)      not null
#  target_path :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  receiver_id :bigint           not null
#
# Indexes
#
#  index_notifications_on_receiver_id  (receiver_id)
#
# Foreign Keys
#
#  fk_rails_...  (receiver_id => users.id)
#
class Notification < ApplicationRecord
  belongs_to :receiver, class_name: 'User'

  scope :integrated, lambda {
    where(created_at: into_one.values).order(created_at: :desc)
  }

  def self.match_post_comment_posted(comment:, receiver:)
    Notification.create!(
      receiver:,
      target_path: "/post/#{comment.id}",
      message: "#{comment.user.nickname}さんが思考メモ「#{comment.commentable.title}」にコメントしました",
      is_read: false
    )
  end

  def self.into_one
    select(:target_path).group(:target_path).maximum(:created_at)
  end
end
