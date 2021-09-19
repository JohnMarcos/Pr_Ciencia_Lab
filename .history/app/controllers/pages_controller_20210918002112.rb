class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    if current_user.enrollments.where(user_id: current_user.id)[0]
      @current_user_enrollments = []
    else
      @current_user_enrollments = current_user.enrollments.where(user_id: current_user.id)
    end
  end
end
