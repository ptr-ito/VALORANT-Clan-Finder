module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authorize_request!
  end

  private

  def authorize_request!
    authorize_request = AuthorizationService.new(request.headers)
    @current_user = authorize_request.current_user
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end
end
