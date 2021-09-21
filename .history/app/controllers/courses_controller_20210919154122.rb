class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @current_user_enrollments = current_user.enrollments
  end

  def show
    @course = Course.find(params[:id])
    @firs_lesson_id = @course.lesson_ids.first
    @enrollment = Enrollment.find(course_id: @course.id, user_id: current_user.id)
    if @enrollment.nil?
      @enrollment_status = "No"
      @enrollment_id = []
    else
      @enrollment_status = "Si"
    end
  end
end
