user_1 =
  User.create(
    first_name: "Johnny",
    last_name: "Doe",
    city: "New York",
    zip_code: "10001",
    email: "johnny.doe@gmail.com",
    password: "password"
  )
user_2 =
  User.create(
    first_name: "John",
    last_name: "Doe",
    city: "New York",
    zip_code: "10001",
    email: "john.doe@gmail.com",
    password: "password"
  )
user_3 =
  User.create(
    first_name: "Jake",
    last_name: "Doe",
    city: "Boston",
    zip_code: "02108",
    email: "jake.doe@gmail.com",
    password: "password"
  )

seller_1 = Seller.create(user: user_2)
seller_2 = Seller.create(user: user_3)

Insertion.create(
  seller: seller_1,
  title: "Iphone 13",
  description: "Iphone 13 by Apple California",
  price: 895,
  categories: 3
)
Insertion.create(
  seller: seller_1,
  title: "Iphone 14",
  description: "Iphone 14 by Apple California",
  price: 1050,
  categories: 3
)
Insertion.create(
  seller: seller_1,
  title: "MacBook PRO M2",
  description: "MacBook PRO M2 by Apple California",
  price: 2500,
  categories: 3
)
Insertion.create(
  seller: seller_2,
  title: "Iron Man",
  description: "Iron Man by Marvel",
  price: 10,
  categories: 4
)

Review.create(user: user_1, seller: seller_1, rating: 5)
Review.create(user: user_3, seller: seller_1, rating: 4)
Review.create(user: user_1, seller: seller_2, rating: 4)
Review.create(user: user_2, seller: seller_2, rating: 2)
