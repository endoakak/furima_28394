class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @item = Item.find(params[:item_id])
    if @comment.save
      redirect_to item_path(@item.id)
    else
      render template: "items/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id).merge(item_id: params[:item_id])
  end
end
