require "rails_helper"

RSpec.describe Review, type: :request do
  describe "POST /meeting" do
    it "create a new meeting" do
      user_1 = User.create(first_name: "Mario", last_name: "Rossi", city: "Roma", zip_code: "00100", email: "mario.rossi@gmail.com", password: "password")
      expect(user_1).to be_valid
      user_2 = User.create(first_name: "Paolo", last_name: "Rossi", city: "Roma", zip_code: "00100", email: "paolo.rossi@gmail.com", password: "password")
      expect(user_2).to be_valid
      seller = Seller.create(user: user_1)
      expect(seller).to be_valid
      insertion = Insertion.create(seller: seller, title: "Inserzione #1", description: "Descrizione #1", price: 10, categories: "films")
      expect(insertion).to be_valid
      meeting = Meeting.create(insertion: insertion, seller: seller, user: user, date: "Thu, 11 Aug 2022 15:45:00.000000000 UTC +00:00", place: "Via Roma 100")
      expect(meeting).to be_valid
    end
  end
end