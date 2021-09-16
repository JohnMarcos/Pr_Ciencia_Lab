class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
  end

  def index
    @lessons = Lesson.all
  end
end
