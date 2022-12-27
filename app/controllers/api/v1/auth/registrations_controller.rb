class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Users::RegistrationsConcern
  prepend_before_action :configure_sign_up_params, only: %i[create]
  prepend_before_action :configure_account_update_params, only: %i[update]
end
