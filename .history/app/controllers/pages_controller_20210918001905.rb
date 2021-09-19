class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    current_user.enrollments.where(user_id: current_user.id).nil?
  end
end
