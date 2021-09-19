class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @current_user_enrollments = current_user.enrollments
  end

  def show
    @course = Course.find(params[:id])
    @current_user_enrollment = @course.enrollments.where(user_id: current_user.id).first
  end

  def enrollment_status?
    @course_enrollment_id = Course.find(params[:id]).enrollments.select { |user| user.user_id == current_user.id }[0].user_id
    @enrollment_status = @course_enrollments == current_user ? "Si" : "No"
  end
end
