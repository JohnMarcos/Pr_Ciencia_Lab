class Lesson < ApplicationRecord
  belongs_to :course
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :comments, :course
end
