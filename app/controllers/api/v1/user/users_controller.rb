class Api::V1::User::UsersController < ApplicationController

  def show
    user = User.find_by(uuid: params[:id])
    render_json = User::ProfileSerializer.new(user).serializable_hash.to_json
    render json: render_json, status: :ok
  end


  private

  def user_params
    params.permit(:name, :image, :self_introduction, :rank_id, :twitter_name, :youtube_url, :started_on_val, :highest_rank_id, :ingame_name, agent_ids: [])
  end
end
