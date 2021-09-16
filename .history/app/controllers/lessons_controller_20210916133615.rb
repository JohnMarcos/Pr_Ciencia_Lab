class LessonsController < ApplicationController
  before_action :set_course, only: [:show]
  def show
    @lesson = Lesson.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end
end
