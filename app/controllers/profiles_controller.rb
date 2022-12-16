class ProfilesController < ApplicationController
  def show; end

  def edit; end

  def update
    if user.update(user_params)
      render json: user
    else
      render json: user.errors
    end
  end

  def set_user
    user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache, :self_introduction)
  end
end
