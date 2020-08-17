class CommentsController < ApplicationController
  def create
    binding.pry
    Comment.create(comment_params)
    @comments = Comment.find_by(item_id: params[:item_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:item_id, :text).merge(user_id: current_user.id)
  end
end
