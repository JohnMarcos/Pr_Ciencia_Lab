class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
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
    @enrollments_current_user = Enrollment.all.select { |user| user.user_id == current_user.id }
    @enrollments_current_user_id = @enrollments_current_user.first.id
  end
end
