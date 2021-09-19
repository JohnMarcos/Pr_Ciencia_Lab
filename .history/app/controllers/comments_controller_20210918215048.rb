class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to :back
  end

  def create
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
