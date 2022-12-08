class Api::V1::MatchesController < ApplicationController
  def inedx
    matches = Match.all
    render_json = MatchListSerializer.new(matches).serializable_hash.to_json
    render json: render_json, status: :ok
  end

  def show
    matche = Match.find_by!(id: params[:id])
    render_json = MatchListSerializer.new(match).serializable_hash.to_json
    render json: render_json, status: :ok
  end
end
