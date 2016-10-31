require 'rails_helper'

RSpec.describe User, type: :model do

  	before do
		@valid_attributes = {
			:name => "Joe",
			:email => "joe@sample.com",
			:password => "joe"
		}
		end

  	it "creates a new instance given valid attributes" do
  			expect{User.create(@valid_attributes)}.to change { User.count }.by(1)
  	end

  	it "increases count in model User object instance" do
  		expect{User.create(@valid_attributes)}.to change { User.count }.from(0).to(1)
  	end

  	it "should not save person without first name" do
  		p = User.new

  		expect(p.name).to eq nil
  		expect(p.save).to be false
  	end

  	it "should not save person without email" do
  		person2 = User.new(name: "Drew")
  		expect(person2).not_to be_valid
  	end

  	it "saves the User's name" do
  		p = User.create(name: "John")
  		expect(p.name).to eq "John"
  	end

  	it "can make a person from the factory" do
  		p = FactoryGirl.create(:user)
  		expect(p).not_to be_nil
  		expect(p).to be_kind_of(User)
  	end


end
