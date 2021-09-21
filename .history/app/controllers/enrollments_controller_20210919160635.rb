class EnrollmentsController < ApplicationController
  def new
  end

  def index
    @courses = Course.all
    @enrollments = Enrollment.all
    @course_enrollments = current_user.enrollments
  end

  def create
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.new(course_id: @course, user_id: current_user)
    @enrollment.save
    redirect_to courses_path
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:course_id, :user_id)
  end
end

@comment = Comment.new(comment_params)
@comment.user_id = current_user.id
@comment.lesson_id = params[:lesson_id]
@comment.save