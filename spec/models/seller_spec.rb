require "rails_helper"

RSpec.describe Seller, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:insertion) }
    it { should have_many(:meeting) }
    it { should have_many(:review) }
  end
end
