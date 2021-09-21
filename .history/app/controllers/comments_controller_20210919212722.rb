class CommentsController < ApplicationController
  before_action :set_find_course_enrollment_lesson, only: %i[show new edit]
  before_action :set_comment, only: %i[show update destroy]
  before_action :set_params_course_enrollment_lesson, only: %i[create update destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.lesson_id = params[:lesson_id]
    @comment.save
    redirect_to course_enrollment_lesson_path(@course, @enrollment, @lesson), notice: 'Tu comentario fue creado.'
  end

  def edit
    @comment = Comment.find(params[:comment_id])
  end

  def update
    @comment.update(comment_params)
    redirect_to course_enrollment_lesson_path(@course, @enrollment, @lesson)
  end

  def destroy
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

  def set_params_course_enrollment_lesson
    @course = params[:course_id]
    @enrollment = params[:enrollment_id]
    @lesson = params[:lesson_id]
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
