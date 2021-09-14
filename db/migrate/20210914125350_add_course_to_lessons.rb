class AddCourseToLessons < ActiveRecord::Migration[6.0]
  def change
    add_reference :lessons, :course, null: false, foreign_key: true
  end
end
