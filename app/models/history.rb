class History < ApplicationRecord
  belongs_to :insertion
  belongs_to :seller
  belongs_to :user

  validates :date, presence: true
  validates :place, presence: true
end
