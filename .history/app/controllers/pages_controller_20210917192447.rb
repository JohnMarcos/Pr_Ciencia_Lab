class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @current_user_enrollment = current_user.enrollments.where(active: true).first
  end
end
