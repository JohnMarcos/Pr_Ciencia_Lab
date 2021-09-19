class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @current_user_enrollments = current_user.enrollments
  end

  def show
    @course = Course.find(params[:id])
    @current_user_enrollment = @course.enrollments.where(user_id: current_user.id).first
    @course_enrollments = Course.find(params[:id]).enrollments.select { |u| u.user_id == current_user.id }
    if @course_enrollments == nil?
      @enrollment_status = "No"
    else
      @enrollment_status = "Si"
    end
  end
end
