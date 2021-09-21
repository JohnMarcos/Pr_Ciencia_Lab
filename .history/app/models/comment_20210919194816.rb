class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  validates :comment, presence: true, length: { minimun: 4, maximum: 500 }
end
