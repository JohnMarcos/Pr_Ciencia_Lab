class Course < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :lessons, dependent: :destroy
  belongs_to :user,  
  has_many :users, through: :enrollments, dependent: :destroy
  has_many :comments, through: :lessons, dependent: :destroy

  validates :name, presence: true
end
