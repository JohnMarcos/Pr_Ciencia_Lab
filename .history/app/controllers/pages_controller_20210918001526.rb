class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @current_user_enrollments = current_user.enrollments.nil? ? [] : current_user.enrollments
  end
end
