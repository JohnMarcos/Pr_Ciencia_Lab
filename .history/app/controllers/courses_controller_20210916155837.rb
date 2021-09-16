class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @lesson = Course.lesson.find(params[:id])
  end
end
