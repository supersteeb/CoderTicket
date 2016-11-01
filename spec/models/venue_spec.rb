require 'rails_helper'

RSpec.describe Venue, type: :model do

  describe "validate presence" do
    expect(Venue)
  end

  it "should require a name" do
    expect(Venue.new(:name => "")).not_to be_valid
  end

  describe "Associations" do
    it "belongs_to event" do
      assc = described_class.reflect_on_association(:event)
      expect(assc.macro).to eq :belongs_to
    end
  end

  describe "Associations" do
    it "belongs_to region" do
      assc = described_class.reflect_on_association(:region)
      expect(assc.macro).to eq :belongs_to
    end
  end
end