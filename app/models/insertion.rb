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

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  private

  def self.seller_name(id)
    user = User.find(Seller.find(id).user_id)
    "#{user.first_name} #{user.last_name}"
  end
end
