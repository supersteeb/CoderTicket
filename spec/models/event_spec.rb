
require 'rails_helper'

RSpec.describe Event, type: :model do

  it "should require a name" do
    expect(Event.new(:name => "")).not_to be_valid
  end

  it "should require an ends_at" do
    expect(Event.new(:ends_at => "")).not_to be_valid
  end

  it "should require a starts_at" do
    expect(Event.new(:starts_at => "")).not_to be_valid
  end

  describe "Associations" do
    it "belongs_to user" do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs_to venue" do
      assc = described_class.reflect_on_association(:venue)
      expect(assc.macro).to eq :belongs_to
    end

    it "belongs_to category" do
      assc = described_class.reflect_on_association(:category)
      expect(assc.macro).to eq :belongs_to
    end
  end


end