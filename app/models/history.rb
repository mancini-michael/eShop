class History < ApplicationRecord
  belongs_to :insertion
  belongs_to :seller
  belongs_to :user

  has_one_attached :image

  validates :date, presence: true
  validates :place, presence: true
end
