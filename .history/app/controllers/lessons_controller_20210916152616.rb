class LessonsController < ApplicationController
  def show
    @lesson = Course.lesson.find(params[:id])
  end

  def index
    @lessons = Lesson.all
  end
end
