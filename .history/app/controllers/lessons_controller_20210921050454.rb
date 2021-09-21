class LessonsController < ApplicationController
  def show
    @current_user_enrollments = current_user.enrollments.where(user_id: current_user.id)
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
    @enrollment = Enrollment.find_by(course_id: @course.id, user_id: current_user.id)
  end

  def new
    @course = Course.find(params[:course_id])
    @lesson = Lesson.new
  end

  def create
    enrollment = Enrollment.find_by(course_id: params[:course_id], user_id: current_user.id)
    if enrollment.nil?
      redirect_to mis_cursos_creados_courses_path
    else
      @lesson = Lesson.new(lesson_params)
      @lesson.course = Course.find(params[:course_id])
      if @lesson.save
        redirect_to mis_cursos_creados_courses_path
      else
        render :new
      end
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.find(params[:enrollment_id])
    @lesson = Lesson.find(params[:lesson_id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)
    redirect_to mis_cursos_creados_courses_path
  end

  def destroy
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.find_by(course_id: @course.id, user_id: current_user.id)
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    @lesson_first_id = Lesson.find_by(course_id: @course.id, order: 1)
    redirect_to course_enrollment_lesson_mis_lecciones_creadas_path(course_id: c.id, enrollment_id: enrollment_course.id, lesson_id: @lesson_first_id)
  end

  def mis_lecciones_creadas
    @course = Course.find(params[:course_id])
    @enrollment = Enrollment.find(params[:enrollment_id])
    @lesson = Lesson.find(params[:lesson_id])
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :description)
  end
end