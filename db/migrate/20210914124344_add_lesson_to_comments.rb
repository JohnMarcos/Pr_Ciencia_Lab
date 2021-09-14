class AddLessonToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :lesson, null: false, foreign_key: true
  end
end
