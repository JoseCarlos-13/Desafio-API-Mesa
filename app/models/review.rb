class Review < ApplicationRecord
  validates :rating, presence: true
  validates :comment, presence: true

  belongs_to :user
  belongs_to :place

  enum rating: { awful: 0, bad: 1, ok: 2, good: 3, excellent: 4 }
end
