class Api::V1::User::SessionsController < ApplicationController
  def index
    if current_api_v1_user
      json_string = UserSerializer.new(current_api_v1_user).serializable_hash.to_json
      render json: json_string
    else
      render json: { is_login: false, message: 'ユーザーが存在しません' }
    end
  end
end
