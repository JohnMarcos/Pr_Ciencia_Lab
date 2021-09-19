class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.find(params[:enrollment_id])
    @lesson = Lesson.find(params[:lesson_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.course_id = Course.find(params[:course_id])
    @comment.enrollment_id = Enrollment.find(params[:enrollment_id])
    @comment.lesson_id = Lesson.find(params[:lesson_id])
    @comment.user_id = current_user.id
    @comment.save
    redirect_to course_enrollment_lesson_path(@course, @enrollment, @lesson)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
