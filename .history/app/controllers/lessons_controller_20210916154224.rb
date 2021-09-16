class LessonsController < ApplicationController
  def show

  end

  def index
    @lessons = Lesson.all
  end
end
