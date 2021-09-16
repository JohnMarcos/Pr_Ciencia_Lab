class LessonsController < ApplicationController
  def show
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
  end

  def index
    @lessons = Lesson.all
  end
end
