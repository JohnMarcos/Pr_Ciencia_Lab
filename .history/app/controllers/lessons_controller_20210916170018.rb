class LessonsController < ApplicationController
  def show
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
    @comment = Comment.find(params[:id])
  end
end
