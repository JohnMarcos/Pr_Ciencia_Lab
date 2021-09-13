class AddUserToEnrollments < ActiveRecord::Migration[6.0]
  def change
    add_reference :enrollments, :user, null: false, foreign_key: true
  end
end
