class LessonsController < ApplicationController
  def show
    @current_user_enrollments = current_user.enrollments.where(user_id: current_user.id)
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
    @enrollment = Enrollment.find_by(course_id: @course.id, user_id: current_user.id)
  end
end
