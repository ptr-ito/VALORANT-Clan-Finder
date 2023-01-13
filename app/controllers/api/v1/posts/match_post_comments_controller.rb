class Api::V1::Posts::MatchPostCommentsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: %i[create update destroy]

  def index
    match_post = MatchPost.find(params[:match_post_id])
    comments = match_post.match_post_comments.all
    json_string = MatchPostCommentSerializer.new(comments).serializable_hash.to_json
    render json: json_string
  end

  def create
    comment = current_api_v1_user.match_post_comments.build(comment_params)
    if comment.save
      json_string = MatchPostCommentSerializer.new(comment).serializable_hash.to_json
      render json: json_string, status: :ok
    else
      render json: json_string.errors, status: :bad_request
    end
  end

  def update
    comment = MatchPostComment.find(params[:id])
    if comment.update(comment_params)
      json_string = MatchPostCommentSerializer.new(comment).serializable_hash.to_json
      render json: json_string, status: :ok
    else
      render json: json_string.errors, status: :bad_request
    end
  end

  def destroy
    comment = current_api_v1_user.match_post_comments.find(params[:id])
    comment.destroy!
    comment = MatchPostComment.all
    json_string = MatchPostCommentSerializer.new(comment).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  private

  def comment_params
    params.permit(:id, :content, :parent_id, :match_post_id)
  end
end
