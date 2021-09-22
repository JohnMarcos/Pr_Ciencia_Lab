class Course < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :lessons, dependent: :destroy
  belongs_to :user
  has_many :users, through: :enrollments
  has_many :comments, through: :lessons
  has_one_attached :image

  validates :name, presence: true
end
