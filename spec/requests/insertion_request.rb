require "rails_helper"

RSpec.describe Insertion, type: :request do
  describe "POST /insertion" do
    it "create a new insertion" do
      user = User.create(first_name: "Mario", last_name: "Rossi", city: "Roma", zip_code: "00100", email: "mario.rossi@gmail.com", password: "password")
      expect(user).to be_valid
      seller = Seller.create(user: user)
      expect(seller).to be_valid
      insertion = Insertion.create(seller: seller, title: "Inserzione #1", description: "Descrizione #1", price: 10, categories: "films")
      expect(insertion).to be_valid
    end
  end
  
  describe "GET /insertion/search" do
    it "find an insertion" do
      user = User.create(first_name: "Mario", last_name: "Rossi", city: "Roma", zip_code: "00100", email: "mario.rossi@gmail.com", password: "password")
      expect(user).to be_valid
      seller = Seller.create(user: user)
      expect(seller).to be_valid
      insertion = Insertion.create(seller: seller, title: "Inserzione #1", description: "Descrizione #1", price: 10, categories: "films")
      expect(insertion).to be_valid
      get "/insertion/search", params: { search: "Inserzione" }
      expect(response).to have_http_status(200)
    end
  end
end