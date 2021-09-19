class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @current_user_enrollments = current_user.enrollments
  end

  def show
    @course = Course.find(params[:id])
    @current_user_enrollment = @course.enrollments.where(user_id: current_user.id).first
  end

  def enrollment_status
    @course = Course.find(params[:id])
    @course.enrollments.select { |user| user.user_id == current_user.id}[0].user_id == current_user ? "Si" : "No"
    
    @current_user_enrollment = @course.enrollments.where(user_id: current_user.id).first
  end
end
