class CommentsController < ApplicationController
  def new
    @item = Item.find(params[:id])
    @comment = @item.comments.build
  end

  def create
    @item = Item.find(params[:id])
    @comment = @item.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to("/items/#{params[:id]}")
    else
      render "comments/new"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:description, :post_date)
    end
end
