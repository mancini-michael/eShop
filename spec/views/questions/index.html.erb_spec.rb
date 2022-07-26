require 'rails_helper'

RSpec.describe "questions/index", type: :view do
  before(:each) do
    assign(:questions, [
      Question.create!(
        seller_id: "Seller",
        question: "Question",
        reply: "Reply"
      ),
      Question.create!(
        seller_id: "Seller",
        question: "Question",
        reply: "Reply"
      )
    ])
  end

  it "renders a list of questions" do
    render
    assert_select "tr>td", text: "Seller".to_s, count: 2
    assert_select "tr>td", text: "Question".to_s, count: 2
    assert_select "tr>td", text: "Reply".to_s, count: 2
  end
end
