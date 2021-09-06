require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:photo) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_one(:commentator) }
  end

  describe "Validations" do
  end
end
