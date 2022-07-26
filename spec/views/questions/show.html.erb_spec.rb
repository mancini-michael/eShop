require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      seller_id: "Seller",
      question: "Question",
      reply: "Reply"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Seller/)
    expect(rendered).to match(/Question/)
    expect(rendered).to match(/Reply/)
  end
end
