class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @current_user_enrollments = current_user.enrollments.where(user_id: current_user.id)
  end

  def show
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
      redirect_to @course
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
      redirect_to courses_path
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  def mis_cursos_creados
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
