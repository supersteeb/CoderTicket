require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
  	it "checks for presence of name" do
  		a = FactoryGirl.create(:category)
  		expect(a).to eq true
  	end
  end

  describe "Associations" do
    it "has_many events" do
      assc = described_class.reflect_on_association(:events)
      expect(assc.macro).to eq :has_many
    end
  end

end
