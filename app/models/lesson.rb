class Lesson < ApplicationRecord
  belongs_to :course
  has_many :commets
end
