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
    raise
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.find(params[:enrollment_id])
    @lesson = Lesson.find(params[:lesson_id])
    @comment = Comment.new(user_id: current_user.id, lesson_id: params[:lesson_id], comment: params[:comment])
    @comment.user_id = current_user.id
    @comment.lesson_id = Lesson.find(params[:lesson_id])
    @comment.save
    redirect_to course_enrollment_lesson_path(@course, @enrollment, @lesson)
  end

  private
end
