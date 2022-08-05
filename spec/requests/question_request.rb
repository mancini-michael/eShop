require "rails_helper"

RSpec.describe Question, type: :request do
  describe "POST /question" do
    it "create a new question" do
      user = User.create(first_name: "Mario", last_name: "Rossi", city: "Roma", zip_code: "00100", email: "mario.rossi@gmail.com", password: "password")
      expect(user).to be_valid
      seller = Seller.create(user: user)
      expect(seller).to be_valid
      insertion = Insertion.create(seller: seller, title: "Inserzione #1", description: "Descrizione #1", price: 10, categories: "films")
      expect(insertion).to be_valid
      question = Question.create(insertion_id: insertion.id, user_id: user.id, question: "Domanda #1", reply: "")
      expect(question).to be_valid
    end
  end

  describe "DELETE /question" do
    it "delete a question" do
      user = User.create(first_name: "Mario", last_name: "Rossi", city: "Roma", zip_code: "00100", email: "mario.rossi@gmail.com", password: "password")
      expect(user).to be_valid
      seller = Seller.create(user: user)
      expect(seller).to be_valid
      insertion = Insertion.create(seller: seller, title: "Inserzione #1", description: "Descrizione #1", price: 10, categories: "films")
      expect(insertion).to be_valid
      question = Question.create(insertion_id: insertion.id, user_id: user.id, question: "Domanda #1", reply: "")
      expect(question).to be_valid
      question_deleted = Question.destroy(question.id)
      expect(question_deleted).to be_valid
    end
  end
end