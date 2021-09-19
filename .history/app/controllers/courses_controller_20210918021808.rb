class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @current_user_enrollments = current_user.enrollments
  end

  def show
    @course = Course.find(params[:id])
    @firs_lesson_id = @course.lesson_ids.first
    @current_user_enrollment = @course.enrollments.where(user_id: current_user.id).ids
    if @current_user_enrollment.empty?
        @enrollment_status = "No"
        @enrollment_id = nil
    else
        @enrollment_status = "Si"
        @enrollment_id = @current_user_enrollment.first
    end
  end
end
