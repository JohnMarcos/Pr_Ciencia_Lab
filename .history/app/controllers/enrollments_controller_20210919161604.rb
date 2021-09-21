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
    @enrollment = Enrollment.new()
    @enrollment.course_id = @course.id
    @enrollment.user_id = current_user.id
    @firs_lesson_id = @course.lesson_ids.first
    @enrollment.save
    raise
    redirect_to course_enrollment_lesson_path(course: @course.id, enrollment: @enrollment.id, lesson: @firs_lesson_id)
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:course_id, :user_id)
  end
end
