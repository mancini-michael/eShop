require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      user_id: 1,
      seller_id: 1,
      rating: 1
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input[name=?]", "review[user_id]"

      assert_select "input[name=?]", "review[seller_id]"

      assert_select "input[name=?]", "review[rating]"
    end
  end
end
