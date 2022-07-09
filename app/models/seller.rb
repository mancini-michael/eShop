class Seller < ApplicationRecord
  belongs_to :user
  has_many :review

  private

  def self.average_rating(id)
    Review.group(:seller_id).average(:rating)[id].to_i
  end
end
