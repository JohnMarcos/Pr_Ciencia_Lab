class CommentsController < ApplicationController
  before_action :set_find_course_enrollment_lesson, only: %i[show new edit]

  def show
    @comment = Comment.find(params[:id])
  end

  def new
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

  def edit
    @comment = Comment.find(params[:comment_id])
  end

  def update
    @course = params[:course_id]
    @enrollment = params[:enrollment_id]
    @lesson = params[:lesson_id]
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to course_enrollment_lesson_path(@course, @enrollment, @lesson)
  end

  def destroy
    @course = params[:course_id]
    @enrollment = params[:enrollment_id]
    @lesson = params[:lesson_id]
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to course_enrollment_lesson_path(@course, @enrollment, @lesson)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_find_course_enrollment_lesson
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.find(params[:enrollment_id])
    @lesson = Lesson.find(params[:lesson_id])
  end
end
