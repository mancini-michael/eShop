class Insertion < ApplicationRecord
  enum :categories, {
    accessories: 0,
    beauty: 1,
    books: 2,
    eletronics: 3,
    films: 4,
    games: 5,
    healts: 6,
    musics: 7,
    photos: 8,
    sports: 9,
    videogames: 10
  },
  prefix: true

  belongs_to :seller
  has_many :question
  has_many :history

  has_one_attached :image

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  def seller_location
    User.find(seller_id).location
  end

  def map 
    response = HTTP.get("https://maps.googleapis.com/maps/api/staticmap?center=40.714728,-73.998672&zoom=12&size=400x400&maptype=roadmap&key=AIzaSyABJc3-uSJdVUa1YJbAua2NRnqZx3UxnlI&signature=YOUR_SIGNATURE")
    response.parse
  end 

  private

  def self.seller_name(id)
    user = User.find(Seller.find(id).user_id)
    "#{user.first_name} #{user.last_name}"
  end
end
