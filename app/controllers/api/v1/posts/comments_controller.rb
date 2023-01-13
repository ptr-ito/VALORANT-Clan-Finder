class Api::V1::Posts::CommentsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: %i[create update destroy]

  def index
    match_post = MatchPost.find(params[:match_post_id])
    comments = match_post.comments.includes(:user, :replies).order(created_at: :asc)
    json_string = CommentSerializer.new(comments).serializable_hash.to_json
    render json: json_string
  end

  def create
    if comment = Comment.find_by(id: params[:root_id])
      reply = comment.replies.build(comment_params.merge(user_id: current_api_v1_user.id))
      if reply.save
        json_string = CommentSerializer.new(reply).serializable_hash.to_json
        render json: json_string, status: :ok
      else
        render json: json_string.errors, status: :bad_request
      end
    else
      comment = current_api_v1_user.comments.build(comment_params)
      if comment.save
        json_string = CommentSerializer.new(comment).serializable_hash.to_json
        render json: json_string, status: :ok
      else
        render json: json_string.errors, status: :bad_request
      end
    end
  end


  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      json_string = CommentSerializer.new(comment).serializable_hash.to_json
      render json: json_string, status: :ok
    else
      render json: json_string.errors, status: :bad_request
    end
  end

  def destroy
    comment = current_api_v1_user.comments.find(params[:id])
    comment.destroy!
    comment = Comment.all
    json_string = CommentSerializer.new(comment).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  private

  def comment_params
    params.permit(:id, :content, :parent_id, :match_post_id)
  end
end
