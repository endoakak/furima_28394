class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    @comments = Comment.find_by(item_id: params[:item_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id).merge(item_id: params[:item_id])
  end
end
