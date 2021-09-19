class Course < ApplicationRecord
  has_many :enrollments
  has_many :lessons
  belongs_to :user

  has_many :comments, through: :lessons
end
