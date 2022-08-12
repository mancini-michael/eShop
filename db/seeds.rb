user_1 = User.create(
    first_name: "Mario",
    last_name: "Rossi",
    city: "Zagarolo",
    zip_code: "00039",
    address: "Via vicinale colle dell'oro 7",
    email: "mario.rossi@gmail.com",
    password: "password")
user_2 = User.create(
    first_name: "Paolo",
    last_name: "Verdi",
    city: "Frosinone",
    zip_code: "03100",
    address: "Via Mastruccia 82",
    email: "paolo.verdi@gmail.com",
    password: "password")
user_3 = User.create(
    first_name: "Lorenzo",
    last_name: "Blu",
    city: "Anzio Colonia",
    zip_code: "00042",
    address: "Via Rimini 96",
    email: "lorenzo.blu@gmail.com",
    password: "password")

seller_1 = Seller.create(user: user_2.id)
seller_2 = Seller.create(user: user_3.id)

insertion_1 = Insertion.new(
  seller: seller_1.id,
  title: "Iphone 13",
  description: "Iphone 13 by Apple California",
  price: 895,
  categories: 3
)
insertion_1.image.attach(io: File.open("db/seeds/iphone-13.jfif"), filename: "iphone-13.jpg")
insertion_1.save

insertion_2 = Insertion.new(
  seller: seller_1.id,
  title: "Iphone 12",
  description: "Iphone 12 by Apple California",
  price: 1050,
  categories: 3
)
insertion_2.image.attach(io: File.open("db/seeds/iphone-12.jfif"), filename: "iphone-12.jpg")
insertion_2.save

insertion_3 = Insertion.new(
  seller: seller_1.id,
  title: "MacBook PRO M2",
  description: "MacBook PRO M2 by Apple California",
  price: 2500,
  categories: 3
)
insertion_3.image.attach(io: File.open("db/seeds/macbook-pro-m2.jfif"), filename: "macbook-pro-m2.jpg")
insertion_3.save

insertion_4 = Insertion.create(
  seller: seller_2.id,
  title: "Iron Man",
  description: "Iron Man by Marvel",
  price: 10,
  categories: 4
)
insertion_4.image.attach(io: File.open("db/seeds/iron-man.jfif"), filename: "iron-man.jpg")
insertion_4.save

Review.create(user: user_1.id, seller: seller_1, rating: 5)
Review.create(user: user_3.id, seller: seller_1, rating: 4)
Review.create(user: user_1.id, seller: seller_2, rating: 4)
Review.create(user: user_2.id, seller: seller_2, rating: 2)
