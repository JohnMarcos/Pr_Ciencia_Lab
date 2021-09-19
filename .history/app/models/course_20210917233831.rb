class Course < ApplicationRecord
  has_many :enrollments
  has_many :lessons
  
  has_many :users, through: :enrollments
  has_many :comments, through: :lessons
end
