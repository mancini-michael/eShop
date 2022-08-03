require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it { should have_one(:seller) }
    it { should have_many(:cart) }
    it { should have_many(:meeting) }
    it { should have_many(:review) }
    it { should have_many(:wishlist) }
    it { should have_many(:question) }
  end
end
