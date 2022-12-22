class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update]
  def show
    render_json = User::ProfileSerializer.new(@user).serializable_hash.to_json
    render json: render_json, status: :ok
  end

  def edit; end

  def update
    @user.name = user_params[:name]
    @user.rank_id = user_params[:rank_id]
    @user.agent_id = user_params[:agent_id]
    @user.self_introduction = user_params[:self_introduction]
    @user.image = user_params[:image] if user_params[:image] != ""

    if @user.save
      render json: { status: 200, user: @user }
    else
      render json: { status: 500, message: "更新に失敗しました" }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :image, :self_introduction, :rank_id, :agent_id)
  end
end
