class Insertion < ApplicationRecord
  enum :categories,
       {
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
end
