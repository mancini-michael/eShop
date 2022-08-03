require "rails_helper"

RSpec.describe Insertion, type: :model do
  describe "associations" do
    it { should belong_to(:seller) }
    it { should have_many(:question) }
  end
end
