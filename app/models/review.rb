class Review < ApplicationRecord
  belongs_to :user
  belongs_to :seller

  validates :rating, numericality: { in: 1..5 }
end
