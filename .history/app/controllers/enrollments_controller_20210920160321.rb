class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.all
  end

  def create
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.new
    @enrollment.course_id = @course.id
    @enrollment.user_id = current_user.id
    @enrollment.save
    redirect_to course_path(@course)
  end

  def mis_cursos_enrrolados
    @enrollments = Enrollment.all.select { |user| user.user_id == current_user.id }
  end
end
