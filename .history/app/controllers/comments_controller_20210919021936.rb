class CommentsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.find(params[:enrollment_id])
    @lesson = Lesson.find(params[:lesson_id])
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

  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id]) 
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
