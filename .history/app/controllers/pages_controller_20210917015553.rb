class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @enrolled = Enrollment.find_by(user: current_user, course: @course)
  end
end
