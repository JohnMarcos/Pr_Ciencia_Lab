class EnrollmentsController < ApplicationController
  def new
  end

  def index
    @courses = Course.all
    @enrollments = Enrollment.all
    @course = Course.find(params[:id])
  end

  def show
    @course = Course.find(params[:id])
    @enrollment = Enrollment.find_by(user: current_user, course: @course)
  end

  def create
  end
end
