require "rails_helper"

RSpec.describe Wishlist, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:insertion) }
  end
end
