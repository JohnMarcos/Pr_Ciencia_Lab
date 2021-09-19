class EnrollmentsController < ApplicationController
  def new
  end

  def show
    @course = Course.find(params[:id])
    @enrolled = Enrollment.find_by(user: current_user, course: @course)
  end

  def create
  end
end
