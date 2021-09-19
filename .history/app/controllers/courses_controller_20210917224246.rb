class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @current_user_enrollments = current_user.enrollments
  end

  def show
    @course = Course.find(params[:id])
    @current_user_enrollment = @course.enrollments.where(user_id: current_user.id).first
    @course_enrollments_id = Course.find(params[:id]).enrollments.select { |u| u.user_id == current_user.id }[0].
    if @course_enrollments_id == current_user.id
      @enrollment_status = "Si"
    else
      @enrollment_status = "No"
    end
  end
end
