class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @course = Course.find(params[:id])
    @user = current_user
    @enrollment = Enrollment.find_by(user: current_user, course: @course)
  end
end
