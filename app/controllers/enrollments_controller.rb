class EnrollmentsController < ApplicationController
  def new
  end

  def index
    @courses = Course.all
    @enrollments = Enrollment.all
    @course_enrollments = current_user.enrollments
  end

  def show
    @course = Course.find(params[:id])
    @enrollment = Enrollment.find_by(user: current_user, course: @course)
  end

  def create
  end
end
