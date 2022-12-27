class Api::V1::Auth::ConfirmationsController < DeviseTokenAuth::ConfirmationsController
  include DeviseTokenAuth::Concerns::SetUserByToken
end
