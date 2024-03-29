class Seller < ApplicationRecord
  belongs_to :user
  has_many :insertion, dependent: :destroy
  has_many :meeting, dependent: :destroy
  has_many :review
  has_many :history

  private

  def self.average_rating(id)
    Review.group(:seller_id).average(:rating)[id].to_i
  end
  
  def self.total_reviews(id)
    Review.group(:seller_id).count[id]
  end
end
