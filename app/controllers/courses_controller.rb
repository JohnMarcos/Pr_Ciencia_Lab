class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @courses = Course.all
  end

  def show
    @current_user_enrollments = current_user.enrollments.where(user_id: current_user.id)
    @course = Course.find(params[:id])
    @firs_lesson_id = @course.lesson_ids.first
    @enrollment = Enrollment.find_by(course_id: @course.id, user_id: current_user.id) # Primero filtra por curso, luego por usuario
    if @enrollment.nil?
      @enrollment_status = "No"
      @enrollment_id = []
    else
      @enrollment_status = "Si"
    end
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    if @course.save
      @enrollment = Enrollment.new
      @enrollment.course_id = @course.id
      @enrollment.user_id = current_user.id
      @enrollment.save
      redirect_to mis_cursos_creados_courses_path
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.description = params[:description]
    @course.user_id = current_user.id
    if @course.update(course_params)
      redirect_to mis_cursos_creados_courses_path
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to mis_cursos_creados_courses_path
  end

  def mis_cursos_creados
    @courses = Course.all.select { |course| course.user_id == current_user.id }
    @enrollments_current_user = Enrollment.all.select { |user| user.user_id == current_user.id }
  end

  private

  def course_params
    params.require(:course).permit(:name, :description, :image) # Permitidos en el formulario
  end
end
