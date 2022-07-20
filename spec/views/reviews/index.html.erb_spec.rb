require 'rails_helper'

RSpec.describe "reviews/index", type: :view do
  before(:each) do
    assign(:reviews, [
      Review.create!(
        user_id: 2,
        seller_id: 3,
        rating: 4
      ),
      Review.create!(
        user_id: 2,
        seller_id: 3,
        rating: 4
      )
    ])
  end

  it "renders a list of reviews" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
