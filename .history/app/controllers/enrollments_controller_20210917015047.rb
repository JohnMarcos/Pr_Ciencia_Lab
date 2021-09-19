class EnrollmentsController < ApplicationController
  def new
  end

  def show
    @enrolled = Enrollment.find_by(user: current_user, course: @course)
  end
end
