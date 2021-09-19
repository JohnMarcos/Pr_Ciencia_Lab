class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @current_user_enrollments = current_user.enrollments
  end

  def show
    @course = Course.find(params[:id])
    @current_user_enrollment = @course.enrollments.where(user_id: current_user.id)[0].name
    if @current_user_enrollment.nil?
      @enrollment_status = "No"
    else
      @enrollment_status = "Si"
    end
  end
end
