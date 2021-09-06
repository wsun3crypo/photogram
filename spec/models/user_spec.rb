require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:posts) }

    it { should have_many(:comments) }

    it { should have_many(:request_received) }

    it { should have_many(:requests_sent) }

    it { should have_many(:likes) }

    it { should have_many(:photos) }

    end

    describe "InDirect Associations" do

    it { should have_many(:commentss) }

    end

    describe "Validations" do

    end
end
