class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @current_user_enrollments = @course.enrollments.where(user_id: current_user.id).first
    @current_user_enrollments? = @current_user_enrollments.nil? ? false : true
  end
end
