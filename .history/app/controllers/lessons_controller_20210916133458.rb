class LessonsController < ApplicationController
  before_action :id
  def show
    @lesson = Lesson.find(params[:id])
  end
  
  def set_course
    @course = Course.find(params[:course_id])
  end
end
