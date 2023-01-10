class Api::V1::Posts::MatchPostCommentsController < ApplicationController
  def create
    comment = current_api_v1_user.match_post_comments.build(comment_params)
    if comment.save
      json_string = MatchPostCommentSerializer.new(comment).serializable_hash.to_json
      render json: json_string, status: :ok
    else
      render json: json_string.errors, status: :bad_request
    end
  end

  private

  def comment_params
    params.permit(:content).merge(match_post_id: params[:match_post_id])
  end
end
