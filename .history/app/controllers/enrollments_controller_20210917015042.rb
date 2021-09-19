class EnrollmentsController < ApplicationController
  def new
  end

  def show
    @enrollment = Enrollment.find_by(user: current_user, course: @course)
  end
end
