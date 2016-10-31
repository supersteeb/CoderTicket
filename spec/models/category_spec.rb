require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
  	it "checks for presence of name" do
  		category = FactoryGirl.create(:category)
  		expect(category).to eq true
  	end
  end

end
