class EnrollmentsController < ApplicationController
  def show

    @course = Course.find(params[:id])
    @firs_lesson_id = @course.lesson_ids.first
    @enrollment = Enrollment.find_by(course_id: @course.id, user_id: current_user.id)
  end

  def new
  end

  def index
    @courses = Course.all
    @enrollments = Enrollment.all
    @course_enrollments = current_user.enrollments
  end

  def create
    @course = Course.find(params[:course_id])
    @firs_lesson_id = @course.lesson_ids.first
    @enrollment = Enrollment.new
    @enrollment.course_id = @course.id
    @enrollment.user_id = current_user.id
    @enrollment.save
    redirect_to course_enrollment_lesson_path(course_id: @course.id, enrollment_id: @enrollment.id, lesson_id: @firs_lesson_id)
  end
end
