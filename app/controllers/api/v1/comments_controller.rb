class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: %i[create update destroy]

  def index
    comments = commentable.comments.includes(:user).order(created_at: :asc)
    json_string = CommentSerializer.new(comments).serializable_hash.to_json
    render json: json_string
  end

  def create
    if comment = Comment.find_by(id: params[:root_id])  # rubocop:disable Lint/AssignmentInCondition
      @reply = comment.replies.build(comment_params.merge(user_id: current_api_v1_user.id,
                                                          commentable:))
      reply_comment
    else
      @comment = current_api_v1_user.comments.build(comment_params.merge(commentable:))
      root_comment
    end
  end

  def update
    comment = Comment.find(params[:id])
    json_string = CommentSerializer.new(comment).serializable_hash.to_json
    if comment.update(comment_params)
      render json: json_string, status: :ok
    else
      render400(nil, article.errors.full_messages)
    end
  end

  def destroy
    comment = current_api_v1_user.comments.find(params[:id])
    comment.destroy!
    comment = Comment.all.includes(:user).order(created_at: :asc)
    json_string = CommentSerializer.new(comment).serializable_hash.to_json
    render json: json_string, status: :ok
  end

  private

  def comment_params
    params.permit(:id, :content, :root_id)
  end

  def commentable
    params[:commentable_type].constantize.find_by(id: params[:commentable_id])
  end

  def reply_comment
    if @reply.save
      json_string = CommentSerializer.new(@reply).serializable_hash.to_json
      render json: json_string
    else
      render400(nil, @reply.errors.full_messages)
    end
  end

  def root_comment
    if @comment.save
      json_string = CommentSerializer.new(@comment).serializable_hash.to_json
      render json: json_string
    else
      render400(nil, @comment.errors.full_messages)
    end
  end
end
