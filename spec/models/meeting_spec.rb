require "rails_helper"

RSpec.describe Meeting, type: :model do
  describe "association" do
    it { should belong_to(:insertion) }
    it { should belong_to(:seller) }
    it { should belong_to(:user) }
  end
end
