require "rails_helper"

RSpec.describe Review, type: :request do
  describe "POST /review/create" do
    it "create a new review" do
      user_1 = User.create(first_name: "Mario", last_name: "Rossi", city: "Roma", zip_code: "00100", email: "mario.rossi@gmail.com", password: "password")
      expect(user_1).to be_valid
      user_2 = User.create(first_name: "Paolo", last_name: "Rossi", city: "Roma", zip_code: "00100", email: "paolo.rossi@gmail.com", password: "password")
      expect(user_2).to be_valid
      seller = Seller.create(user: user_1)
      expect(seller).to be_valid
      insertion = Insertion.create(seller: seller, title: "Inserzione #1", description: "Descrizione #1", price: 10, categories: "films")
      expect(insertion).to be_valid
      review = Review.create(user: user_2, seller: seller, rating: 5)
      expect(review).to be_valid
    end
  end
end