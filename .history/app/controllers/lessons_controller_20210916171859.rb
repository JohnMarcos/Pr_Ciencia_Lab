class LessonsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
  end
end
