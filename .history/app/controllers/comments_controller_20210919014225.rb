class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @course = params[:course_id]
    @enrollment = params[:enrollment_id]
    @lesson = params[:lesson_id]
    @comment = Comment.new
  end

  def create
    @course = params[:course_id]
    @enrollment = params[:enrollment_id]
    @lesson = params[:lesson_id]
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.lesson_id = params[:lesson_id]
    @comment.save
    redirect_to course_enrollment_lesson_path(@course, @enrollment, @lesson)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end