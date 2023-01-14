class Api::V1::NotificationsController < ApplicationController
  def index
    notifications = current_api_v1_user.notifications.integrated
  end
end
