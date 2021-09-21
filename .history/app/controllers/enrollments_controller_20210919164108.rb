class EnrollmentsController < ApplicationController
  def show
  end

  def new
  end

  def index
    @courses = Course.all
    @enrollments = Enrollment.all
    @course_enrollments = current_user.enrollments
  end

  def create
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.new
    @enrollment.course_id = @course.id
    @enrollment.user_id = current_user.id
    @enrollment.save
    redirect_to course_path(course_id: @course.id)
  end
end
