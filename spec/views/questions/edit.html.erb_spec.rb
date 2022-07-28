require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      seller_id: "MyString",
      question: "MyString",
      reply: "MyString"
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input[name=?]", "question[seller_id]"

      assert_select "input[name=?]", "question[question]"

      assert_select "input[name=?]", "question[reply]"
    end
  end
end