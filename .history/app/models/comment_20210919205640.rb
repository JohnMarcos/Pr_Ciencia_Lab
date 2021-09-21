class Comment < ApplicationRecord
  belongs_to :user, polimorphic: true
  belongs_to :lesson

  validates :comment , presence: true
end
