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
