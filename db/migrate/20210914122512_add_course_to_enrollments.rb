class AddCourseToEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_reference :enrollments, :course, null: false, foreign_key: true
  end
end
