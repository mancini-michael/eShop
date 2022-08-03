require "rails_helper"

RSpec.describe Question, type: :model do
  describe "associations" do 
    it { should belong_to(:insertion) }
    it { should belong_to(:user) }
  end
end
