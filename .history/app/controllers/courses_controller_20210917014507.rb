class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @enrolled = Enrollment.find_by(user: current_user, course: @course)
  end
end
