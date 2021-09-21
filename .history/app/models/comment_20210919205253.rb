class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
  validates :comment , presence: true
end
