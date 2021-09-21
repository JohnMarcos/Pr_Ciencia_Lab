class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @current_user_enrollments = current_user.enrollments
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
    if @course.update(course_params)
      redirect_to @course
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end
end
