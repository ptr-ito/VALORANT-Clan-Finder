class Api::V1::Posts::MatchPostsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: %i[create update destroy]

  def index
    # render json: {match_posts: MatchPost.all.order("created_at DESC") }
    match_posts = MatchPost.all.published.includes(:user, :ranks).order(created_at: :desc)
    render_json = MatchPostSerializer.new(match_posts).serializable_hash.to_json
    render json: render_json, status: :ok
  end

  def show
    match_post = MatchPost.find(params[:id])
    render_json = MatchPostSerializer.new(match_post).serializable_hash.to_json
    render json: render_json, status: :ok
  end

  def create
    match_post = current_api_v1_user.match_posts.build(match_post_params)
    # ranks = Rank.where(id: params[:rank_id].split(','))
    if match_post.save
      # match_post.ranks << ranks
      json_string = MatchPostSerializer.new(match_post).serializable_hash.to_json
      render json: json_string, status: :ok
    else
      render json: json_string.errors, status: :bad_request
    end
  end

  def update
    match_post = MatchPost.find(params[:id])
    if match_post.update(match_post_params)
      json_string = MatchPostSerializer.new(match_post).serializable_hash.to_json
      render json: json_string, status: :ok
    else
      render json: match_post.errors, status: :bad_request
    end
  end

  def destroy
    match_post = current_api_v1_user.match_posts.find(params[:id])
    match_post.destroy!
    match_posts = MatchPost.all.published.order(created_at: :desc)
    json_string = MatchPostSerializer.new(match_post).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  private

  def match_post_params
    params.permit(:content, :mode_id, :mood_id, :status, rank_ids: [])
  end
end
