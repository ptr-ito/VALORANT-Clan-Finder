class Api::V1::Notifications::ReadsController < ApplicationController
  def create
    notification = Notification.find(params[:notification_id])
    notifications = current_user.notifications.where(target_path: notification.target_path)
    notifications.update_all(is_read: true)
    head :ok
  end
end
