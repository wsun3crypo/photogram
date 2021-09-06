require "rails_helper"

RSpec.describe Like, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:photo) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_one(:liker) }
  end

  describe "Validations" do
  end
end
