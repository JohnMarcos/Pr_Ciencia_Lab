class EnrollmentsController < ApplicationController
  def new
  end

  def show
    @enrolled = Enrollment.find_by(user: current_user, course: @course)
  end

  def create
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.new(course_id: params[:course_id])
    @enrollment.user = current_user
    if @enrollment.save
      redirect_to course_path(params[:course_id])
    else
      redirect_to course_path(@course)
    end
  end
end
