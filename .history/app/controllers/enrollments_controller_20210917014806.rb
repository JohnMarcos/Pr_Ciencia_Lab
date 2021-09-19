class EnrollmentsController < ApplicationController
  def new
  end
  def def show
    @enrollment = Enrollment.find(params[:id])
  end
end
