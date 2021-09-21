class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :lesson, polimorphic: true

  validates :comment, presence: true
end
