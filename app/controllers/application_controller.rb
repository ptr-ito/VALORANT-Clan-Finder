class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token
  helper_method :current_user, :user_signed_in?

  rescue_from ActionController::Redirecting::UnsafeRedirectError do
    redirect_to root_url
  end
end
