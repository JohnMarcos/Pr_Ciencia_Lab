class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def new
  end

  def create
  end
end
